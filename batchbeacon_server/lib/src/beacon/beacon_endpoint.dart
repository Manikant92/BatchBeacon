import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'beacon_service.dart';

class BeaconEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Hospital>> demoOrganizations(Session session) async {
    final u = await BeaconService.member(session);
    if (u.role != 'PLATFORM_ADMINISTRATOR') {
      throw StateError('Platform administrator required.');
    }
    final own = (await Hospital.db.findById(session, u.hospitalId))!;
    final demo = own.organizationType == 'FICTIONAL_DEMO';
    return (await Hospital.db.find(
      session,
    )).where((h) => (h.organizationType == 'FICTIONAL_DEMO') == demo).toList();
  }

  Future<List<AuditEvent>> organizationAudit(
    Session session,
    int hospitalId,
  ) async {
    final u = await BeaconService.member(session);
    if (u.role != 'PLATFORM_ADMINISTRATOR' && u.hospitalId != hospitalId) {
      throw StateError('Audit access denied.');
    }
    final hospital = await Hospital.db.findById(session, hospitalId);
    final own = (await Hospital.db.findById(session, u.hospitalId))!;
    if (hospital == null ||
        (hospital.organizationType == 'FICTIONAL_DEMO') !=
            (own.organizationType == 'FICTIONAL_DEMO')) {
      throw StateError('Organization access denied.');
    }
    return AuditEvent.db.find(
      session,
      where: (t) => t.hospitalId.equals(hospitalId),
      orderBy: (t) => t.timestamp.desc(),
      limit: 200,
    );
  }

  Future<void> setDemoOrganizationStatus(
    Session session,
    int hospitalId,
    String status,
  ) async {
    final u = await BeaconService.member(session);
    if (u.role != 'PLATFORM_ADMINISTRATOR' ||
        !['ACTIVE', 'PAUSED'].contains(status)) {
      throw StateError('Platform administrator required.');
    }
    await session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      final hospital = await Hospital.db.findById(
        session,
        hospitalId,
        transaction: tx,
      );
      final own = (await Hospital.db.findById(
        session,
        u.hospitalId,
        transaction: tx,
      ))!;
      if (hospital == null ||
          (hospital.organizationType == 'FICTIONAL_DEMO') !=
              (own.organizationType == 'FICTIONAL_DEMO') ||
          hospitalId == u.hospitalId) {
        throw StateError('Organization cannot be changed.');
      }
      final previous = hospital.status;
      hospital.status = status;
      await Hospital.db.updateRow(session, hospital, transaction: tx);
      await AuditEvent.db.insertRow(
        session,
        AuditEvent(
          hospitalId: hospitalId,
          actorId: u.authUserId,
          entityType: 'Hospital',
          entityId: hospitalId,
          action: 'ORGANIZATION_STATUS',
          timestamp: DateTime.now().toUtc(),
          previousState: previous,
          newState: status,
        ),
        transaction: tx,
      );
    });
    await BeaconService.publish(session, [hospitalId], 'ORGANIZATION_STATUS');
  }

  Future<HospitalUser> me(Session session) => BeaconService.member(session);
  Future<WorkspaceSnapshot> dashboard(Session session, int hospitalId) =>
      BeaconService.snapshot(session, hospitalId);
  Future<List<RescueCandidate>> findRescueOptions(
    Session session,
    int hospitalId,
    int medicineId,
  ) async {
    final u = await BeaconService.member(session, hospitalId: hospitalId);
    BeaconService.inventoryRole(u);
    return session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      return BeaconService.candidates(session, hospitalId, medicineId, tx);
    });
  }

  Future<RescueProposal> propose(
    Session session,
    int hospitalId,
    int medicineId,
    int batchId,
    String requestKey,
  ) => BeaconService.propose(
    session,
    hospitalId,
    medicineId,
    batchId,
    requestKey,
  );
  Future<RescueProposal> act(
    Session session,
    int proposalId,
    String action,
    String note,
  ) => BeaconService.act(session, proposalId, action, note);

  Stream<BeaconEvent> watch(Session session) async* {
    final u = await BeaconService.member(session);
    BeaconService.inventoryRole(u);
    final stream = session.messages.createStream<BeaconEvent>(
      'batchbeacon.${u.hospitalId}',
    );
    yield BeaconEvent(
      hospitalId: u.hospitalId,
      category: 'CONNECTED',
      timestamp: DateTime.now().toUtc(),
    );
    await for (final event in stream) {
      final current = await BeaconService.member(session);
      if (current.hospitalId != u.hospitalId || current.role != u.role) {
        throw StateError('Stream authorization changed.');
      }
      yield event;
    }
  }

  /// Atomic all-or-nothing CSV intake. Never updates quantities of reserved batches.
  Future<int> importInventory(
    Session session,
    int hospitalId,
    String csv,
  ) async {
    final u = await BeaconService.member(session, hospitalId: hospitalId);
    BeaconService.inventoryRole(u);
    if (csv.length > 100000) {
      throw ArgumentError('CSV too large. Limit 100 KB.');
    }
    final lines = csv.trim().split(RegExp(r'\r?\n'));
    if (lines.isEmpty ||
        lines.first.trim() !=
            'product_code,batch_number,quantity,expiry,storage,quality') {
      throw ArgumentError(
        'Expected CSV header: product_code,batch_number,quantity,expiry,storage,quality',
      );
    }
    if (lines.length > 501) throw ArgumentError('Limit 500 rows.');
    final count = await session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      var count = 0;
      for (var n = 1; n < lines.length; n++) {
        if (lines[n].trim().isEmpty) continue;
        final v = lines[n].split(',').map((s) => s.trim()).toList();
        if (v.length != 6 || !RegExp(r'^[A-Za-z0-9-]{1,80}$').hasMatch(v[1])) {
          throw ArgumentError(
            'Row ${n + 1}: six unquoted fields and a valid batch identifier required.',
          );
        }
        final q = int.tryParse(v[2]);
        final expiry = DateTime.tryParse(v[3]);
        if (q == null ||
            q < 0 ||
            q > 10000000 ||
            expiry == null ||
            !['VERIFIED', 'UNKNOWN'].contains(v[4]) ||
            !['RELEASED', 'QUARANTINED'].contains(v[5])) {
          throw ArgumentError(
            'Row ${n + 1}: invalid quantity, expiry or status.',
          );
        }
        final m = await Medicine.db.findFirstRow(
          session,
          where: (t) => t.canonicalProductCode.equals(v[0]),
          transaction: tx,
        );
        if (m == null) {
          throw ArgumentError('Row ${n + 1}: unknown exact product code.');
        }
        await BeaconService.checkProductScope(session, hospitalId, m.id!, tx);
        final existing = await InventoryBatch.db.findFirstRow(
          session,
          where: (t) =>
              t.hospitalId.equals(hospitalId) &
              t.medicineId.equals(m.id!) &
              t.batchNumber.equals(v[1]),
          transaction: tx,
        );
        if (existing != null) {
          throw ArgumentError(
            'Row ${n + 1}: batch exists; import cannot overwrite stock.',
          );
        }
        final b = await InventoryBatch.db.insertRow(
          session,
          InventoryBatch(
            hospitalId: hospitalId,
            medicineId: m.id!,
            batchNumber: v[1],
            quantityOnHand: q,
            quantityReserved: 0,
            expiryDate: expiry.toUtc(),
            storageStatus: v[4],
            qualityStatus: v[5],
            lastUpdatedAt: DateTime.now().toUtc(),
            version: 1,
          ),
          transaction: tx,
        );
        await AuditEvent.db.insertRow(
          session,
          AuditEvent(
            hospitalId: hospitalId,
            actorId: u.authUserId,
            entityType: 'InventoryBatch',
            entityId: b.id!,
            action: 'CSV_IMPORT',
            timestamp: DateTime.now().toUtc(),
            previousState: '',
            newState: '${b.batchNumber}: $q units',
          ),
          transaction: tx,
        );
        count++;
      }
      return count;
    });
    await BeaconService.publish(session, [hospitalId], 'INVENTORY');
    return count;
  }

  Future<void> recordConsumption(
    Session session,
    int hospitalId,
    int medicineId,
    DateTime date,
    int quantity,
  ) async {
    final u = await BeaconService.member(session, hospitalId: hospitalId);
    BeaconService.inventoryRole(u);
    final today = DateTime.now().toUtc();
    if (quantity < 0 ||
        quantity > 1000000 ||
        date.isAfter(today) ||
        date.isBefore(today.subtract(const Duration(days: 365)))) {
      throw ArgumentError('Invalid consumption date or quantity.');
    }
    await session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      await BeaconService.checkProductScope(
        session,
        hospitalId,
        medicineId,
        tx,
      );
      if (await Medicine.db.findById(session, medicineId, transaction: tx) ==
          null) {
        throw ArgumentError('Unknown product.');
      }
      final day = DateTime.utc(date.year, date.month, date.day);
      final old = await ConsumptionRecord.db.findFirstRow(
        session,
        where: (t) =>
            t.hospitalId.equals(hospitalId) &
            t.medicineId.equals(medicineId) &
            t.date.equals(day),
        transaction: tx,
      );
      if (old != null) {
        old.quantityUsed = quantity;
        await ConsumptionRecord.db.updateRow(session, old, transaction: tx);
      } else {
        await ConsumptionRecord.db.insertRow(
          session,
          ConsumptionRecord(
            hospitalId: hospitalId,
            medicineId: medicineId,
            date: day,
            quantityUsed: quantity,
          ),
          transaction: tx,
        );
      }
      await AuditEvent.db.insertRow(
        session,
        AuditEvent(
          hospitalId: hospitalId,
          actorId: u.authUserId,
          entityType: 'ConsumptionRecord',
          entityId: medicineId,
          action: 'CONSUMPTION_UPDATED',
          timestamp: today,
          previousState: '',
          newState: '$day: $quantity',
        ),
        transaction: tx,
      );
    });
    await BeaconService.publish(session, [hospitalId], 'CONSUMPTION');
  }

  Future<void> updatePolicy(
    Session session,
    int hospitalId,
    int safetyDays,
    int transitDays,
    int shelfLifeDays,
    int horizonDays,
  ) async {
    final u = await BeaconService.member(session, hospitalId: hospitalId);
    if (u.role != 'HOSPITAL_ADMINISTRATOR') {
      throw StateError('Hospital administrator required.');
    }
    if (safetyDays < 1 ||
        safetyDays > 60 ||
        transitDays < 1 ||
        transitDays > 30 ||
        shelfLifeDays < 1 ||
        shelfLifeDays > 365 ||
        horizonDays < 1 ||
        horizonDays > 90) {
      throw ArgumentError('Policy values out of bounds.');
    }
    await session.db.transaction((tx) async {
      await BeaconService.lock(session, tx);
      final p = await BeaconService.policy(session, hospitalId, tx: tx);
      final old = p.toJson().toString();
      p.safetyStockDays = safetyDays;
      p.transitDays = transitDays;
      p.minimumRemainingShelfLifeDays = shelfLifeDays;
      p.forecastHorizonDays = horizonDays;
      await HospitalPolicy.db.updateRow(session, p, transaction: tx);
      await AuditEvent.db.insertRow(
        session,
        AuditEvent(
          hospitalId: hospitalId,
          actorId: u.authUserId,
          entityType: 'HospitalPolicy',
          entityId: p.id!,
          action: 'POLICY_UPDATED',
          timestamp: DateTime.now().toUtc(),
          previousState: old,
          newState: p.toJson().toString(),
        ),
        transaction: tx,
      );
    });
    await BeaconService.publish(session, [hospitalId], 'POLICY');
  }

  Future<String> investigate(
    Session session,
    int hospitalId,
    int medicineId,
  ) async {
    final u = await BeaconService.member(session, hospitalId: hospitalId);
    BeaconService.inventoryRole(u);
    return session.db.transaction((tx) async {
      final f = await BeaconService.forecast(
        session,
        hospitalId,
        medicineId,
        tx,
      );
      final options = await BeaconService.candidates(
        session,
        hospitalId,
        medicineId,
        tx,
      );
      return 'RULES-BASED EXPLANATION · Gemini is not configured.\n\nEstimated demand: ${f.averageDailyConsumption.toStringAsFixed(1)} units/day. ${f.forecastMethod}\n\nProjected replenishment gap: ${f.requiredQuantity} units. Reserved stock and unconfirmed inbound are excluded.\n\n${options.map((c) => '${c.hospitalName}: ${c.reason} Maximum eligible quantity: ${c.maximumQuantity}.').join('\n\n')}\n\nPharmacist review: confirm product identity, institutional authority, licensing, chain of custody and transport/storage conditions. All actions are synthetic simulations; forecasts are estimates.';
    });
  }
}

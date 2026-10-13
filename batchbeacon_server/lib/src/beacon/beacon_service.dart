import 'dart:math' as math;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';
import '../generated/future_calls.dart';
import 'engine.dart';

class BeaconService {
  static Future<void> checkProductScope(
    Session s,
    int hid,
    int mid,
    Transaction tx,
  ) async {
    final h = await Hospital.db.findById(s, hid, transaction: tx);
    final m = await Medicine.db.findById(s, mid, transaction: tx);
    if (h == null ||
        m == null ||
        (h.organizationType != 'FICTIONAL_DEMO' &&
            m.canonicalProductCode.startsWith('DEMO-BB-'))) {
      throw StateError('Product is not available in this workspace.');
    }
  }

  static Future<void> lock(Session s, Transaction tx) => s.db
      .unsafeQuery('SELECT pg_advisory_xact_lock(424242)', transaction: tx)
      .then((_) {});

  static Future<HospitalUser> member(
    Session s, {
    int? hospitalId,
    Transaction? tx,
  }) async {
    final auth = s.authenticated;
    if (auth == null) throw StateError('Sign in required.');
    final user = await HospitalUser.db.findFirstRow(
      s,
      where: (t) => t.authUserId.equals(auth.authUserId),
      transaction: tx,
    );
    if (user == null ||
        user.status != 'ACTIVE' ||
        (hospitalId != null && user.hospitalId != hospitalId)) {
      throw StateError('Organization access denied.');
    }
    final hospital = await Hospital.db.findById(
      s,
      user.hospitalId,
      transaction: tx,
    );
    if (hospital == null || hospital.status != 'ACTIVE') {
      throw StateError('Organization is not active.');
    }
    return user;
  }

  static void inventoryRole(HospitalUser u) {
    if (![
      'INVENTORY_MANAGER',
      'HOSPITAL_ADMINISTRATOR',
      'PHARMACIST',
    ].contains(u.role)) {
      throw StateError('Inventory access denied.');
    }
  }

  static void pharmacist(HospitalUser u) {
    if (u.role != 'PHARMACIST') {
      throw StateError('A pharmacist must approve and simulate this transfer.');
    }
  }

  static Future<HospitalPolicy> policy(
    Session s,
    int hid, {
    Transaction? tx,
  }) async => (await HospitalPolicy.db.findFirstRow(
    s,
    where: (t) => t.hospitalId.equals(hid),
    transaction: tx,
  ))!;

  static Future<ShortageForecast> forecast(
    Session s,
    int hid,
    int mid,
    Transaction tx, {
    bool save = false,
  }) async {
    await checkProductScope(s, hid, mid, tx);
    final f = ForecastEngine.calculate(
      hospitalId: hid,
      medicineId: mid,
      history: await ConsumptionRecord.db.find(
        s,
        where: (t) => t.hospitalId.equals(hid) & t.medicineId.equals(mid),
        transaction: tx,
      ),
      batches: await InventoryBatch.db.find(
        s,
        where: (t) => t.hospitalId.equals(hid) & t.medicineId.equals(mid),
        transaction: tx,
      ),
      inbound: await InboundSupply.db.find(
        s,
        where: (t) => t.hospitalId.equals(hid) & t.medicineId.equals(mid),
        transaction: tx,
      ),
      policy: await policy(s, hid, tx: tx),
      now: DateTime.now().toUtc(),
    );
    if (!save) return f;
    final existing = await ShortageForecast.db.findFirstRow(
      s,
      where: (t) => t.hospitalId.equals(hid) & t.medicineId.equals(mid),
      transaction: tx,
    );
    if (existing != null) {
      f.id = existing.id;
      return ShortageForecast.db.updateRow(s, f, transaction: tx);
    }
    return ShortageForecast.db.insertRow(s, f, transaction: tx);
  }

  static Future<List<RescueCandidate>> candidates(
    Session s,
    int hid,
    int mid,
    Transaction tx,
  ) async {
    await checkProductScope(s, hid, mid, tx);
    final medicine = await Medicine.db.findById(s, mid, transaction: tx);
    if (medicine == null) throw ArgumentError('Unknown product.');
    final dest = await policy(s, hid, tx: tx);
    final results = <RescueCandidate>[];
    final hospitals = await Hospital.db.find(
      s,
      where: (t) => t.status.equals('ACTIVE'),
      transaction: tx,
    );
    for (final h in hospitals.where((h) => h.id != hid)) {
      // Only demo-network partners opt in. No unrelated hospital inventory is exposed.
      final own = await Hospital.db.findById(s, hid, transaction: tx);
      if (h.organizationType != 'FICTIONAL_DEMO' ||
          own?.organizationType != 'FICTIONAL_DEMO') {
        continue;
      }
      final p = await policy(s, h.id!, tx: tx);
      final f = await forecast(s, h.id!, mid, tx);
      final batches = await InventoryBatch.db.find(
        s,
        where: (t) => t.hospitalId.equals(h.id!) & t.medicineId.equals(mid),
        transaction: tx,
      );
      for (final b in batches) {
        final r = ForecastEngine.match(
          batch: b,
          exactMedicineId: mid,
          donorBatches: batches,
          donorForecast: f,
          sourcePolicy: p,
          destinationPolicy: dest,
          medicine: medicine,
          now: DateTime.now().toUtc(),
        );
        results.add(
          RescueCandidate(
            hospitalName: h.name,
            hospitalId: h.id!,
            batchId: b.id!,
            eligible: r.maximum > 0,
            maximumQuantity: r.maximum,
            donorRetained: r.retained,
            reason: r.reason,
            expiryDate: b.expiryDate,
            arrivalAt: DateTime.now().toUtc().add(
              Duration(days: p.transitDays),
            ),
          ),
        );
      }
    }
    results.sort(
      (a, b) => a.eligible != b.eligible
          ? (a.eligible ? -1 : 1)
          : a.expiryDate.compareTo(b.expiryDate),
    );
    return results;
  }

  static Future<void> event(
    Session s,
    RescueProposal p,
    HospitalUser u,
    String previous,
    Transaction tx, {
    String note = '',
  }) async {
    final now = DateTime.now().toUtc();
    await TransferEvent.db.insertRow(
      s,
      TransferEvent(
        proposalId: p.id!,
        eventType: p.status,
        actorId: u.authUserId,
        timestamp: now,
        metadata: note,
      ),
      transaction: tx,
    );
    for (final hid in {p.sourceHospitalId, p.destinationHospitalId}) {
      await AuditEvent.db.insertRow(
        s,
        AuditEvent(
          hospitalId: hid,
          actorId: u.authUserId,
          entityType: 'RescueProposal',
          entityId: p.id!,
          action: p.status,
          timestamp: now,
          previousState: previous,
          newState: '${p.status}; $note',
        ),
        transaction: tx,
      );
      await Notification.db.insertRow(
        s,
        Notification(
          hospitalId: hid,
          title: 'BB-${p.id.toString().padLeft(5, '0')} · ${p.status}',
          message: note,
          category: 'TRANSFER',
          isRead: false,
          createdAt: now,
        ),
        transaction: tx,
      );
    }
  }

  static Future<void> publish(
    Session s,
    Iterable<int> hospitals,
    String category,
  ) async {
    for (final hid in hospitals.toSet()) {
      await s.messages.postMessage(
        'batchbeacon.$hid',
        BeaconEvent(
          hospitalId: hid,
          category: category,
          timestamp: DateTime.now().toUtc(),
        ),
      );
    }
  }

  static Future<void> release(
    Session s,
    RescueProposal p,
    Transaction tx,
    String status,
  ) async {
    final r = await StockReservation.db.findFirstRow(
      s,
      where: (t) => t.proposalId.equals(p.id!),
      transaction: tx,
    );
    if (r == null || r.status != 'ACTIVE') return;
    final b = (await InventoryBatch.db.findById(
      s,
      r.inventoryBatchId,
      transaction: tx,
    ))!;
    b.quantityReserved -= r.quantity;
    b.version++;
    b.lastUpdatedAt = DateTime.now().toUtc();
    if (b.quantityReserved < 0) {
      throw StateError('Reservation accounting mismatch.');
    }
    await InventoryBatch.db.updateRow(s, b, transaction: tx);
    r.status = status;
    await StockReservation.db.updateRow(s, r, transaction: tx);
  }

  static Future<void> expire(Session s, HospitalUser u, Transaction tx) async {
    final now = DateTime.now().toUtc();
    final reservations = await StockReservation.db.find(
      s,
      where: (t) => t.status.equals('ACTIVE') & (t.expiresAt < now),
      transaction: tx,
    );
    for (final r in reservations) {
      final p = (await RescueProposal.db.findById(
        s,
        r.proposalId,
        transaction: tx,
      ))!;
      if (p.sourceHospitalId != u.hospitalId &&
          p.destinationHospitalId != u.hospitalId) {
        continue;
      }
      if (p.status != 'RESERVED') continue;
      await release(s, p, tx, 'EXPIRED');
      final old = p.status;
      p.status = 'EXPIRED';
      await RescueProposal.db.updateRow(s, p, transaction: tx);
      await event(
        s,
        p,
        u,
        old,
        tx,
        note: 'Reservation expired; stock released.',
      );
    }
  }

  static Future<WorkspaceSnapshot> snapshot(Session s, int hid) async {
    final u = await member(s, hospitalId: hid);
    inventoryRole(u);
    return s.db.transaction((tx) async {
      await lock(s, tx);
      await expire(s, u, tx);
      final hospital = (await Hospital.db.findById(s, hid, transaction: tx))!;
      var medicines = await Medicine.db.find(s, transaction: tx);
      if (hospital.organizationType != 'FICTIONAL_DEMO') {
        final ids = <int>{
          ...(await InventoryBatch.db.find(
            s,
            where: (t) => t.hospitalId.equals(hid),
            transaction: tx,
          )).map((b) => b.medicineId),
          ...(await ConsumptionRecord.db.find(
            s,
            where: (t) => t.hospitalId.equals(hid),
            transaction: tx,
          )).map((c) => c.medicineId),
          ...(await InboundSupply.db.find(
            s,
            where: (t) => t.hospitalId.equals(hid),
            transaction: tx,
          )).map((i) => i.medicineId),
        };
        medicines = medicines
            .where(
              (m) =>
                  ids.contains(m.id) &&
                  !m.canonicalProductCode.startsWith('DEMO-BB-'),
            )
            .toList();
      }
      final forecasts = <ShortageForecast>[];
      for (final m in medicines) {
        forecasts.add(await forecast(s, hid, m.id!, tx, save: true));
      }
      forecasts.sort(
        (a, b) => b.requiredQuantity.compareTo(a.requiredQuantity),
      );
      final proposals = await RescueProposal.db.find(
        s,
        where: (t) =>
            t.sourceHospitalId.equals(hid) |
            t.destinationHospitalId.equals(hid),
        orderBy: (t) => t.createdAt.desc(),
        transaction: tx,
      );
      final events = <TransferEvent>[];
      for (final p in proposals) {
        events.addAll(
          await TransferEvent.db.find(
            s,
            where: (t) => t.proposalId.equals(p.id!),
            orderBy: (t) => t.timestamp,
            transaction: tx,
          ),
        );
      }
      return WorkspaceSnapshot(
        hospital: (await Hospital.db.findById(s, hid, transaction: tx))!,
        membership: u,
        policy: await policy(s, hid, tx: tx),
        medicines: medicines,
        batches: await InventoryBatch.db.find(
          s,
          where: (t) => t.hospitalId.equals(hid),
          transaction: tx,
        ),
        consumption: await ConsumptionRecord.db.find(
          s,
          where: (t) => t.hospitalId.equals(hid),
          transaction: tx,
        ),
        forecasts: forecasts,
        proposals: proposals,
        events: events,
        audit: await AuditEvent.db.find(
          s,
          where: (t) => t.hospitalId.equals(hid),
          orderBy: (t) => t.timestamp.desc(),
          limit: 200,
          transaction: tx,
        ),
        notifications: await Notification.db.find(
          s,
          where: (t) => t.hospitalId.equals(hid),
          orderBy: (t) => t.createdAt.desc(),
          limit: 30,
          transaction: tx,
        ),
      );
    });
  }

  static Future<RescueProposal> propose(
    Session s,
    int hid,
    int mid,
    int batchId,
    String key,
  ) async {
    final u = await member(s, hospitalId: hid);
    inventoryRole(u);
    if (!RegExp(r'^[a-zA-Z0-9-]{8,100}$').hasMatch(key)) {
      throw ArgumentError('Invalid idempotency key.');
    }
    final p = await s.db.transaction((tx) async {
      await lock(s, tx);
      await expire(s, u, tx);
      final existing = await RescueProposal.db.findFirstRow(
        s,
        where: (t) =>
            t.destinationHospitalId.equals(hid) & t.requestKey.equals(key),
        transaction: tx,
      );
      if (existing != null) {
        if (existing.medicineId != mid ||
            existing.inventoryBatchId != batchId) {
          throw StateError(
            'Idempotency key already used for different proposal.',
          );
        }
        return existing;
      }
      final f = await forecast(s, hid, mid, tx, save: true);
      if (f.requiredQuantity <= 0 || f.riskLevel == 'INSUFFICIENT_DATA') {
        throw StateError('No validated shortage to rescue.');
      }
      final options = await candidates(s, hid, mid, tx);
      final candidate = options
          .where((c) => c.batchId == batchId && c.eligible)
          .firstOrNull;
      if (candidate == null) {
        throw StateError('Candidate is ineligible or no longer available.');
      }
      var proposal = await RescueProposal.db.insertRow(
        s,
        RescueProposal(
          sourceHospitalId: candidate.hospitalId,
          destinationHospitalId: hid,
          medicineId: mid,
          inventoryBatchId: batchId,
          proposedQuantity: math.min(
            f.requiredQuantity,
            candidate.maximumQuantity,
          ),
          expiryDate: candidate.expiryDate,
          proposedArrivalAt: candidate.arrivalAt,
          status: 'DRAFT',
          forecastReferenceId: f.id!,
          explanation: candidate.reason,
          requestKey: key,
          createdAt: DateTime.now().toUtc(),
        ),
        transaction: tx,
      );
      await event(s, proposal, u, '', tx, note: 'Synthetic transfer draft.');
      proposal.status = 'PROPOSED';
      await event(s, proposal, u, 'DRAFT', tx, note: proposal.explanation);
      proposal.status = 'PENDING_SOURCE_APPROVAL';
      await event(
        s,
        proposal,
        u,
        'PROPOSED',
        tx,
        note: 'Source pharmacist review required.',
      );
      return RescueProposal.db.updateRow(s, proposal, transaction: tx);
    });
    await publish(s, [p.sourceHospitalId, p.destinationHospitalId], 'PROPOSAL');
    return p;
  }

  static Future<RescueProposal> act(
    Session s,
    int proposalId,
    String action,
    String note,
  ) async {
    final u = await member(s);
    pharmacist(u);
    if (note.length > 1000) throw ArgumentError('Review note too long.');
    final p = await s.db.transaction((tx) async {
      await lock(s, tx);
      await expire(s, u, tx);
      final p = await RescueProposal.db.findById(
        s,
        proposalId,
        transaction: tx,
      );
      if (p == null ||
          ![
            p.sourceHospitalId,
            p.destinationHospitalId,
          ].contains(u.hospitalId)) {
        throw StateError('Proposal access denied.');
      }
      final old = p.status;
      final source = u.hospitalId == p.sourceHospitalId;
      if (action == 'APPROVE') {
        final previous = await Approval.db.findFirstRow(
          s,
          where: (t) =>
              t.proposalId.equals(proposalId) &
              t.hospitalId.equals(u.hospitalId),
          transaction: tx,
        );
        if (previous != null) {
          if (previous.decision == 'APPROVED') return p;
          throw StateError('Proposal was rejected.');
        }
        if (source
            ? old != 'PENDING_SOURCE_APPROVAL'
            : old != 'PENDING_DESTINATION_APPROVAL') {
          throw StateError('Invalid approval state.');
        }
        final destForecast = await forecast(
          s,
          p.destinationHospitalId,
          p.medicineId,
          tx,
        );
        if (destForecast.requiredQuantity < p.proposedQuantity ||
            destForecast.riskLevel == 'INSUFFICIENT_DATA') {
          throw StateError(
            'Recipient shortage changed. Cancel and generate a new proposal.',
          );
        }
        final c = (await candidates(
          s,
          p.destinationHospitalId,
          p.medicineId,
          tx,
        )).where((c) => c.batchId == p.inventoryBatchId).firstOrNull;
        if (c == null || c.maximumQuantity < p.proposedQuantity) {
          throw StateError(
            'Donor stock or eligibility changed. Cancel and generate a new proposal.',
          );
        }
        await Approval.db.insertRow(
          s,
          Approval(
            proposalId: proposalId,
            hospitalId: u.hospitalId,
            reviewerId: u.authUserId,
            decision: 'APPROVED',
            timestamp: DateTime.now().toUtc(),
            note: note,
          ),
          transaction: tx,
        );
        if (source) {
          p.status = 'PENDING_DESTINATION_APPROVAL';
        } else {
          p.status = 'APPROVED';
          await event(s, p, u, old, tx, note: note);
          final b = (await InventoryBatch.db.findById(
            s,
            p.inventoryBatchId,
            transaction: tx,
          ))!;
          b.quantityReserved += p.proposedQuantity;
          b.version++;
          b.lastUpdatedAt = DateTime.now().toUtc();
          if (b.quantityReserved > b.quantityOnHand) {
            throw StateError('Insufficient unreserved stock.');
          }
          await InventoryBatch.db.updateRow(s, b, transaction: tx);
          await StockReservation.db.insertRow(
            s,
            StockReservation(
              proposalId: proposalId,
              inventoryBatchId: b.id!,
              quantity: p.proposedQuantity,
              status: 'ACTIVE',
              expiresAt: DateTime.now().toUtc().add(const Duration(hours: 24)),
            ),
            transaction: tx,
          );
          p.status = 'RESERVED';
        }
      } else if (action == 'REJECT' || action == 'CANCEL') {
        final terminal = action == 'REJECT' ? 'REJECTED' : 'CANCELLED';
        if (old == terminal) return p;
        if (![
          'PENDING_SOURCE_APPROVAL',
          'PENDING_DESTINATION_APPROVAL',
          'RESERVED',
        ].contains(old)) {
          throw StateError('Transfer cannot be closed from $old.');
        }
        if (action == 'REJECT') {
          if (source
              ? old != 'PENDING_SOURCE_APPROVAL'
              : old != 'PENDING_DESTINATION_APPROVAL') {
            throw StateError('Not your approval stage.');
          }
          await Approval.db.insertRow(
            s,
            Approval(
              proposalId: proposalId,
              hospitalId: u.hospitalId,
              reviewerId: u.authUserId,
              decision: 'REJECTED',
              timestamp: DateTime.now().toUtc(),
              note: note,
            ),
            transaction: tx,
          );
        }
        await release(s, p, tx, terminal);
        p.status = terminal;
      } else if (action == 'DISPATCH') {
        if (!source) {
          throw StateError('Only the source pharmacist can simulate dispatch.');
        }
        if (['DISPATCHED_SIMULATED', 'RECEIVED_SIMULATED'].contains(old)) {
          return p;
        }
        if (old != 'RESERVED') {
          throw StateError('Dispatch requires an active reservation.');
        }
        final b = (await InventoryBatch.db.findById(
          s,
          p.inventoryBatchId,
          transaction: tx,
        ))!;
        final sourcePolicy = await policy(s, p.sourceHospitalId, tx: tx);
        final destPolicy = await policy(s, p.destinationHospitalId, tx: tx);
        final arrival = DateTime.now().toUtc().add(
          Duration(days: sourcePolicy.transitDays),
        );
        if (!ForecastEngine.eligible(
          b,
          arrival.add(
            Duration(
              days: math.max(
                sourcePolicy.minimumRemainingShelfLifeDays,
                destPolicy.minimumRemainingShelfLifeDays,
              ),
            ),
          ),
        )) {
          throw StateError('Batch eligibility changed before dispatch.');
        }
        if (b.quantityOnHand < p.proposedQuantity ||
            b.quantityReserved < p.proposedQuantity) {
          throw StateError('Stock accounting mismatch.');
        }
        b.quantityOnHand -= p.proposedQuantity;
        b.quantityReserved -= p.proposedQuantity;
        b.version++;
        b.lastUpdatedAt = DateTime.now().toUtc();
        await InventoryBatch.db.updateRow(s, b, transaction: tx);
        final r = (await StockReservation.db.findFirstRow(
          s,
          where: (t) => t.proposalId.equals(proposalId),
          transaction: tx,
        ))!;
        r.status = 'DISPATCHED';
        await StockReservation.db.updateRow(s, r, transaction: tx);
        p.status = 'DISPATCHED_SIMULATED';
      } else if (action == 'RECEIVE') {
        if (source) {
          throw StateError(
            'Only the destination pharmacist can simulate receipt.',
          );
        }
        if (old == 'RECEIVED_SIMULATED') return p;
        if (old != 'DISPATCHED_SIMULATED') {
          throw StateError('Receipt requires simulated dispatch.');
        }
        final sourceBatch = (await InventoryBatch.db.findById(
          s,
          p.inventoryBatchId,
          transaction: tx,
        ))!;
        // Receipt never releases an expired or unverified batch into available stock.
        final passed = ForecastEngine.eligible(
          sourceBatch,
          DateTime.now().toUtc(),
        );
        await InventoryBatch.db.insertRow(
          s,
          InventoryBatch(
            hospitalId: p.destinationHospitalId,
            medicineId: p.medicineId,
            batchNumber: 'BB-$proposalId-FROM-${sourceBatch.batchNumber}',
            quantityOnHand: p.proposedQuantity,
            quantityReserved: 0,
            expiryDate: p.expiryDate,
            storageStatus: passed ? 'VERIFIED' : 'UNKNOWN',
            qualityStatus: passed ? 'RELEASED' : 'QUARANTINED',
            lastUpdatedAt: DateTime.now().toUtc(),
            version: 1,
          ),
          transaction: tx,
        );
        p.status = 'RECEIVED_SIMULATED';
      } else {
        throw ArgumentError('Unknown transfer action.');
      }
      await RescueProposal.db.updateRow(s, p, transaction: tx);
      await event(
        s,
        p,
        u,
        old,
        tx,
        note: note.isEmpty
            ? 'Simulated action; no physical medicine movement authorized.'
            : note,
      );
      await forecast(s, p.sourceHospitalId, p.medicineId, tx, save: true);
      await forecast(s, p.destinationHospitalId, p.medicineId, tx, save: true);
      return p;
    });
    // Some Cloud plans disable background future calls. The transaction above
    // remains valid; protected reads/actions also expire overdue reservations.
    if (p.status == 'RESERVED' && s.serverpod.config.futureCall.enabled) {
      final reservation = await StockReservation.db.findFirstRow(
        s,
        where: (t) => t.proposalId.equals(p.id!),
      );
      if (reservation != null) {
        await s.serverpod.futureCalls
            .callAtTime(
              reservation.expiresAt,
              identifier: 'reservation-${p.id}',
            )
            .reservation
            .expireReservation(p.id!);
      }
    }
    await publish(s, [p.sourceHospitalId, p.destinationHospitalId], 'TRANSFER');
    return p;
  }
}

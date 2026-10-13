import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:batchbeacon_server/src/generated/protocol.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    'PostgreSQL rescue workflow',
    (builder, endpoints) {
      late Session db;
      late Hospital a, b, c;
      late Medicine product;
      late InventoryBatch donor;
      late TestSessionBuilder asA, asB, asC, asManager, asPlatform;
      Future<TestSessionBuilder> identity(Hospital h, String role) async {
        final id = UuidValue.fromString(const Uuid().v4());
        await HospitalUser.db.insertRow(
          db,
          HospitalUser(
            authUserId: id,
            hospitalId: h.id!,
            role: role,
            status: 'ACTIVE',
          ),
        );
        return builder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            id.toString(),
            {},
          ),
        );
      }

      setUp(() async {
        db = builder.build();
        final key = const Uuid().v4();
        final now = DateTime.now().toUtc();
        final today = DateTime.utc(now.year, now.month, now.day);
        final hs = <Hospital>[];
        for (var n = 0; n < 3; n++) {
          final h = await Hospital.db.insertRow(
            db,
            Hospital(
              name: 'TEST-$key-$n',
              city: 'Fictional',
              organizationType: 'FICTIONAL_DEMO',
              status: 'ACTIVE',
            ),
          );
          hs.add(h);
          await HospitalPolicy.db.insertRow(
            db,
            HospitalPolicy(
              hospitalId: h.id!,
              safetyStockDays: 7,
              minimumRemainingShelfLifeDays: 30,
              permittedShareCategories: ['AMBIENT_DEMO'],
              transferApprovalRequired: true,
              transitDays: 1,
              forecastHorizonDays: 14,
            ),
          );
        }
        a = hs[0];
        b = hs[1];
        c = hs[2];
        product = await Medicine.db.insertRow(
          db,
          Medicine(
            canonicalProductCode: 'TEST-$key',
            displayName: 'Synthetic',
            manufacturer: 'Fictional',
            strength: '10 mg',
            dosageForm: 'Tablet',
            packSize: 1,
            storageCategory: 'AMBIENT_DEMO',
            demoRegulatoryClass: 'SYNTHETIC',
          ),
        );
        for (var n = 0; n < 3; n++) {
          final batch = await InventoryBatch.db.insertRow(
            db,
            InventoryBatch(
              hospitalId: hs[n].id!,
              medicineId: product.id!,
              batchNumber: 'TEST-$key-$n',
              quantityOnHand: [35, 300, 200][n],
              quantityReserved: 0,
              expiryDate: today.add(const Duration(days: 180)),
              storageStatus: 'VERIFIED',
              qualityStatus: 'RELEASED',
              lastUpdatedAt: now,
              version: 1,
            ),
          );
          if (n == 1) donor = batch;
          for (var day = 1; day <= 30; day++) {
            await ConsumptionRecord.db.insertRow(
              db,
              ConsumptionRecord(
                hospitalId: hs[n].id!,
                medicineId: product.id!,
                date: today.subtract(Duration(days: day)),
                quantityUsed: [10, 4, 12][n],
              ),
            );
          }
        }
        asA = await identity(a, 'PHARMACIST');
        asB = await identity(b, 'PHARMACIST');
        asC = await identity(c, 'PHARMACIST');
        asManager = await identity(b, 'INVENTORY_MANAGER');
        asPlatform = await identity(a, 'PLATFORM_ADMINISTRATOR');
      });
      Future<RescueProposal> proposal([String? key]) =>
          endpoints.beacon.propose(
            asA,
            a.id!,
            product.id!,
            donor.id!,
            key ?? 'key-${const Uuid().v4()}',
          );
      test('unauthenticated endpoint denied', () async {
        await expectLater(endpoints.beacon.me(builder), throwsA(anything));
      });
      test(
        'cross-hospital inventory and organization spoofing denied',
        () async {
          await expectLater(
            endpoints.beacon.dashboard(asA, b.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.findRescueOptions(asA, b.id!, product.id!),
            throwsStateError,
          );
        },
      );
      test('platform administrators do not inherit inventory access', () async {
        await expectLater(
          endpoints.beacon.dashboard(asPlatform, a.id!),
          throwsStateError,
        );
      });
      test('matching explains Riverside protection', () async {
        final options = await endpoints.beacon.findRescueOptions(
          asA,
          a.id!,
          product.id!,
        );
        expect(
          options.firstWhere((x) => x.hospitalId == b.id).maximumQuantity,
          216,
        );
        expect(options.firstWhere((x) => x.hospitalId == c.id).eligible, false);
      });
      test(
        'valid lifecycle, duplicate approvals and receiving reconcile exactly once',
        () async {
          var p = await proposal('repeat-${const Uuid().v4()}');
          expect(p.status, 'PENDING_SOURCE_APPROVAL');
          expect(p.proposedQuantity, 175);
          await expectLater(
            endpoints.beacon.act(asA, p.id!, 'DISPATCH', ''),
            throwsStateError,
          );
          p = await endpoints.beacon.act(
            asB,
            p.id!,
            'APPROVE',
            'source reviewed',
          );
          expect(p.status, 'PENDING_DESTINATION_APPROVAL');
          p = await endpoints.beacon.act(asB, p.id!, 'APPROVE', 'retry');
          expect(p.status, 'PENDING_DESTINATION_APPROVAL');
          p = await endpoints.beacon.act(
            asA,
            p.id!,
            'APPROVE',
            'destination reviewed',
          );
          expect(p.status, 'RESERVED');
          await endpoints.beacon.act(asA, p.id!, 'APPROVE', 'retry');
          var stock = (await InventoryBatch.db.findById(db, donor.id!))!;
          expect(stock.quantityOnHand, 300);
          expect(stock.quantityReserved, 175);
          await endpoints.beacon.act(asB, p.id!, 'DISPATCH', 'simulated');
          await endpoints.beacon.act(asB, p.id!, 'DISPATCH', 'retry');
          stock = (await InventoryBatch.db.findById(db, donor.id!))!;
          expect(stock.quantityOnHand, 125);
          expect(stock.quantityReserved, 0);
          p = await endpoints.beacon.act(asA, p.id!, 'RECEIVE', 'simulated');
          expect(p.status, 'RECEIVED_SIMULATED');
          await endpoints.beacon.act(asA, p.id!, 'RECEIVE', 'retry');
          final received = await InventoryBatch.db.find(
            db,
            where: (t) =>
                t.hospitalId.equals(a.id!) & t.medicineId.equals(product.id!),
          );
          expect(received.fold<int>(0, (s, b) => s + b.quantityOnHand), 210);
          expect(
            await Approval.db.count(
              db,
              where: (t) => t.proposalId.equals(p.id!),
            ),
            2,
          );
          expect(
            await AuditEvent.db.count(
              db,
              where: (t) => t.entityId.equals(p.id!),
            ),
            greaterThan(5),
          );
        },
      );
      test('unauthorized approval and role restriction', () async {
        final p = await proposal();
        await expectLater(
          endpoints.beacon.act(asC, p.id!, 'APPROVE', ''),
          throwsStateError,
        );
        await expectLater(
          endpoints.beacon.act(asManager, p.id!, 'APPROVE', ''),
          throwsStateError,
        );
        await expectLater(
          endpoints.beacon.act(asA, p.id!, 'APPROVE', ''),
          throwsStateError,
        );
      });
      test('proposal retries are idempotent', () async {
        final key = 'same-${const Uuid().v4()}';
        final p = await proposal(key);
        expect((await proposal(key)).id, p.id);
      });
      test('CSV validation rolls back entire transaction', () async {
        final count = await InventoryBatch.db.count(
          db,
          where: (t) => t.hospitalId.equals(a.id!),
        );
        await expectLater(
          endpoints.beacon.importInventory(
            asA,
            a.id!,
            'product_code,batch_number,quantity,expiry,storage,quality\n${product.canonicalProductCode},IMPORT-ONE,20,2027-12-31,VERIFIED,RELEASED\nUNKNOWN,IMPORT-TWO,30,2027-12-31,VERIFIED,RELEASED',
          ),
          throwsArgumentError,
        );
        expect(
          await InventoryBatch.db.count(
            db,
            where: (t) => t.hospitalId.equals(a.id!),
          ),
          count,
        );
      });
      test('cancel releases reserved stock', () async {
        var p = await proposal();
        await endpoints.beacon.act(asB, p.id!, 'APPROVE', '');
        await endpoints.beacon.act(asA, p.id!, 'APPROVE', '');
        p = await endpoints.beacon.act(asA, p.id!, 'CANCEL', '');
        expect(p.status, 'CANCELLED');
        expect(
          (await InventoryBatch.db.findById(db, donor.id!))!.quantityReserved,
          0,
        );
      });
      test(
        'concurrent reservations cannot double book donor protected inventory',
        () async {
          final p1 = await proposal();
          final p2 = await proposal();
          await endpoints.beacon.act(asB, p1.id!, 'APPROVE', '');
          await endpoints.beacon.act(asB, p2.id!, 'APPROVE', '');
          Future<bool> attempt(int id) async {
            try {
              await endpoints.beacon.act(asA, id, 'APPROVE', 'race');
              return true;
            } catch (_) {
              return false;
            }
          }

          final results = await Future.wait([attempt(p1.id!), attempt(p2.id!)]);
          expect(results.where((x) => x).length, 1);
          final stock = (await InventoryBatch.db.findById(db, donor.id!))!;
          expect(stock.quantityReserved, 175);
          expect(
            stock.quantityOnHand - stock.quantityReserved,
            greaterThanOrEqualTo(84),
          );
        },
      );
      test('rules-based investigator cannot mutate reservations', () async {
        final before = await StockReservation.db.count(db);
        final text = await endpoints.beacon.investigate(
          asA,
          a.id!,
          product.id!,
        );
        expect(text, contains('RULES-BASED'));
        expect(text, contains('Gemini is not configured'));
        expect(await StockReservation.db.count(db), before);
      });
      test(
        'clean administrators exclude demo records and cannot cross into the demo network',
        () async {
          final clean = await Hospital.db.insertRow(
            db,
            Hospital(
              name: 'CLEAN-${const Uuid().v4()}',
              city: '',
              organizationType: 'HOSPITAL',
              status: 'ACTIVE',
            ),
          );
          await HospitalPolicy.db.insertRow(
            db,
            HospitalPolicy(
              hospitalId: clean.id!,
              safetyStockDays: 7,
              minimumRemainingShelfLifeDays: 30,
              permittedShareCategories: [],
              transferApprovalRequired: true,
              transitDays: 1,
              forecastHorizonDays: 14,
            ),
          );
          final admin = await identity(clean, 'HOSPITAL_ADMINISTRATOR');
          final platform = await identity(clean, 'PLATFORM_ADMINISTRATOR');
          final demo = await Medicine.db.insertRow(
            db,
            product.copyWith(
              id: null,
              canonicalProductCode: 'DEMO-BB-${const Uuid().v4()}',
            ),
          );
          final snapshot = await endpoints.beacon.dashboard(admin, clean.id!);
          expect(snapshot.medicines, isEmpty);
          expect(snapshot.batches, isEmpty);
          expect(snapshot.consumption, isEmpty);
          expect(snapshot.forecasts, isEmpty);
          expect(snapshot.proposals, isEmpty);
          expect(snapshot.audit, isEmpty);
          final organizations = await endpoints.beacon.demoOrganizations(
            platform,
          );
          expect(organizations.any((h) => h.id == clean.id), true);
          expect(
            organizations.every((h) => h.organizationType != 'FICTIONAL_DEMO'),
            true,
          );
          expect(
            (await endpoints.beacon.demoOrganizations(
              asPlatform,
            )).any((h) => h.id == clean.id),
            false,
          );
          await expectLater(
            endpoints.beacon.organizationAudit(platform, b.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.organizationAudit(asPlatform, clean.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.setDemoOrganizationStatus(
              platform,
              b.id!,
              'PAUSED',
            ),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.dashboard(admin, a.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.dashboard(platform, clean.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.findRescueOptions(admin, clean.id!, demo.id!),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.recordConsumption(
              admin,
              clean.id!,
              demo.id!,
              DateTime.now().toUtc(),
              1,
            ),
            throwsStateError,
          );
          await expectLater(
            endpoints.beacon.importInventory(
              admin,
              clean.id!,
              'product_code,batch_number,quantity,expiry,storage,quality\n${demo.canonicalProductCode},CLEAN-TEST,5,2027-12-01,VERIFIED,RELEASED',
            ),
            throwsStateError,
          );
        },
      );
      test('scheduled expiry releases stock exactly once', () async {
        final p = await proposal();
        await endpoints.beacon.act(asB, p.id!, 'APPROVE', '');
        await endpoints.beacon.act(asA, p.id!, 'APPROVE', '');
        final r = (await StockReservation.db.findFirstRow(
          db,
          where: (t) => t.proposalId.equals(p.id!),
        ))!;
        r.expiresAt = DateTime.now().toUtc().subtract(
          const Duration(minutes: 1),
        );
        await StockReservation.db.updateRow(db, r);
        await endpoints.futureCalls.reservation.expireReservation(
          builder,
          p.id!,
        );
        await endpoints.futureCalls.reservation.expireReservation(
          builder,
          p.id!,
        );
        expect(
          (await RescueProposal.db.findById(db, p.id!))!.status,
          'EXPIRED',
        );
        expect(
          (await InventoryBatch.db.findById(db, donor.id!))!.quantityReserved,
          0,
        );
      });
      test(
        'platform administration pauses demo organizations without inventory access',
        () async {
          await endpoints.beacon.setDemoOrganizationStatus(
            asPlatform,
            b.id!,
            'PAUSED',
          );
          await expectLater(
            endpoints.beacon.dashboard(asB, b.id!),
            throwsStateError,
          );
          final audits = await endpoints.beacon.organizationAudit(
            asPlatform,
            b.id!,
          );
          expect(audits.any((a) => a.action == 'ORGANIZATION_STATUS'), true);
          await endpoints.beacon.setDemoOrganizationStatus(
            asPlatform,
            b.id!,
            'ACTIVE',
          );
          await expectLater(
            endpoints.beacon.setDemoOrganizationStatus(asA, b.id!, 'PAUSED'),
            throwsStateError,
          );
        },
      );
    },
    ephemeralDatabase: false,
    rollbackDatabase: RollbackDatabase.disabled,
  );
}

import 'dart:io';
import 'dart:math';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import '../generated/protocol.dart';

class DemoSeed {
  static String password(Session s) {
    final secret = s.serverpod.getPassword('demoAccountPassword');
    if (secret != null && secret.length >= 32) return secret;
    if (s.serverpod.runMode != 'development') {
      throw StateError(
        'Set the demoAccountPassword server secret before enabling cloud demo mode.',
      );
    }
    final file = File('.serverpod/demo_password');
    if (!file.existsSync()) {
      final rng = Random.secure();
      file.parent.createSync(recursive: true);
      file.writeAsStringSync(
        List.generate(
          32,
          (_) => rng.nextInt(256).toRadixString(16).padLeft(2, '0'),
        ).join(),
      );
    }
    return file.readAsStringSync();
  }

  static bool enabled(Session s) =>
      s.serverpod.runMode == 'development' ||
      Platform.environment['BATCHBEACON_DEMO'] == 'true';

  static Future<void> run(Session s) async {
    if (!enabled(s)) throw StateError('Synthetic demo mode is disabled.');
    await s.db.transaction((tx) async {
      await s.db.unsafeQuery(
        'SELECT pg_advisory_xact_lock(424242)',
        transaction: tx,
      );
      if (await Hospital.db.count(s, transaction: tx) > 0) return;
      final now = DateTime.now().toUtc();
      final today = DateTime.utc(now.year, now.month, now.day);
      final hospitals = <Hospital>[];
      for (final name in [
        'Meridian General Hospital',
        'Northstar Medical Center',
        'Riverside Community Hospital',
      ]) {
        hospitals.add(
          await Hospital.db.insertRow(
            s,
            Hospital(
              name: name,
              city: 'Fictional Beacon City',
              organizationType: 'FICTIONAL_DEMO',
              status: 'ACTIVE',
            ),
            transaction: tx,
          ),
        );
      }
      final accountPassword = password(s);
      // Password remains server-side. Public demo access issues genuine module tokens
      // for these isolated synthetic identities only, and never an administrator.
      final provider = AuthServices.getIdentityProvider<EmailIdp>();
      for (var n = 0; n < hospitals.length; n++) {
        for (final role in [
          'PHARMACIST',
          'INVENTORY_MANAGER',
          'HOSPITAL_ADMINISTRATOR',
          if (n == 0) 'PLATFORM_ADMINISTRATOR',
        ]) {
          final auth = await AuthServices.instance.authUsers.create(
            s,
            transaction: tx,
          );
          await provider.admin.createEmailAuthentication(
            s,
            authUserId: auth.id,
            email: email(n, role),
            password: accountPassword,
            transaction: tx,
          );
          await HospitalUser.db.insertRow(
            s,
            HospitalUser(
              authUserId: auth.id,
              hospitalId: hospitals[n].id!,
              role: role,
              status: 'ACTIVE',
            ),
            transaction: tx,
          );
        }
      }
      final medicines = <Medicine>[];
      for (var n = 0; n < 4; n++) {
        medicines.add(
          await Medicine.db.insertRow(
            s,
            Medicine(
              canonicalProductCode: 'DEMO-BB-${n + 1}-EXACT',
              displayName: [
                'Asterin Demo',
                'Lumenex Demo',
                'Velora Demo',
                'Solvex Demo',
              ][n],
              manufacturer: 'Fictional Beacon Labs',
              strength: ['10 mg', '20 mg', '5 mg', '100 ml'][n],
              dosageForm: n == 3 ? 'Sealed solution' : 'Tablet',
              packSize: 1,
              storageCategory: 'AMBIENT_DEMO',
              demoRegulatoryClass: 'SYNTHETIC_NON_CLINICAL',
            ),
            transaction: tx,
          ),
        );
      }
      for (var h = 0; h < 3; h++) {
        final hid = hospitals[h].id!;
        await HospitalPolicy.db.insertRow(
          s,
          HospitalPolicy(
            hospitalId: hid,
            safetyStockDays: 7,
            minimumRemainingShelfLifeDays: 30,
            permittedShareCategories: ['AMBIENT_DEMO'],
            transferApprovalRequired: true,
            transitDays: 1,
            forecastHorizonDays: 14,
          ),
          transaction: tx,
        );
        for (var m = 0; m < medicines.length; m++) {
          final mid = medicines[m].id!;
          final demand = m == 0 ? [10, 4, 12][h] : 2 + m;
          for (var day = 1; day <= 30; day++) {
            await ConsumptionRecord.db.insertRow(
              s,
              ConsumptionRecord(
                hospitalId: hid,
                medicineId: mid,
                date: today.subtract(Duration(days: day)),
                quantityUsed: demand,
              ),
              transaction: tx,
            );
          }
          await InventoryBatch.db.insertRow(
            s,
            InventoryBatch(
              hospitalId: hid,
              medicineId: mid,
              batchNumber: 'DEMO-${h + 1}-${m + 1}-GOOD',
              quantityOnHand: m == 0 ? [35, 500, 200][h] : 350,
              quantityReserved: 0,
              expiryDate: today.add(Duration(days: m == 3 ? 45 : 180)),
              storageStatus: 'VERIFIED',
              qualityStatus: 'RELEASED',
              lastUpdatedAt: now,
              version: 1,
            ),
            transaction: tx,
          );
          await InboundSupply.db.insertRow(
            s,
            InboundSupply(
              hospitalId: hid,
              medicineId: mid,
              quantity: m == 0 ? 20 : 40,
              expectedArrivalDate: today.add(const Duration(days: 10)),
              confirmationStatus: m == 0 ? 'UNCONFIRMED' : 'CONFIRMED',
            ),
            transaction: tx,
          );
        }
      }
      for (final kind in [
        'QUARANTINED',
        'EXPIRED',
        'UNVERIFIED',
        'NEAR_EXPIRY',
      ]) {
        await InventoryBatch.db.insertRow(
          s,
          InventoryBatch(
            hospitalId: hospitals[1].id!,
            medicineId: medicines.first.id!,
            batchNumber: 'DEMO-REJECT-$kind',
            quantityOnHand: 100,
            quantityReserved: 0,
            expiryDate: today.add(
              Duration(
                days: kind == 'EXPIRED'
                    ? -1
                    : kind == 'NEAR_EXPIRY'
                    ? 5
                    : 120,
              ),
            ),
            storageStatus: kind == 'UNVERIFIED' ? 'UNKNOWN' : 'VERIFIED',
            qualityStatus: kind == 'QUARANTINED' ? 'QUARANTINED' : 'RELEASED',
            lastUpdatedAt: now,
            version: 1,
          ),
          transaction: tx,
        );
      }
    });
  }

  static String email(int n, String role) =>
      '${['meridian', 'northstar', 'riverside'][n]}.${role.toLowerCase()}@demo.batchbeacon.invalid';
}

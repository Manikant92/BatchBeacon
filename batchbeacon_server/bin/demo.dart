import 'dart:io';
import 'package:batchbeacon_server/src/generated/serverpod.dart';
import 'package:batchbeacon_server/src/generated/protocol.dart';
import 'package:batchbeacon_server/src/beacon/seed.dart';
import 'package:batchbeacon_server/src/beacon/beacon_service.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// Operator-only CLI. Never exposed as a network endpoint.
Future<void> main(List<String> args) async {
  if (args.length != 1 || !['seed', 'restore'].contains(args.first)) {
    stderr.writeln('Usage: dart run bin/demo.dart seed|restore');
    exitCode = 64;
    return;
  }
  final pod = Serverpod(['--mode', 'development']);
  pod.initializeAuthServices(
    tokenManagerBuilders: [JwtConfigFromPasswords()],
    identityProviderBuilders: [
      ServerpodCloudEmailIdpConfig(appDisplayName: 'BatchBeacon'),
    ],
  );
  final s = await pod.createSession();
  try {
    if (args.first == 'seed') {
      await DemoSeed.run(s);
      stdout.writeln('Idempotent seed complete; existing records preserved.');
      return;
    }
    await s.db.transaction((tx) async {
      await BeaconService.lock(s, tx);
      final hs = await Hospital.db.find(
        s,
        orderBy: (t) => t.id,
        transaction: tx,
      );
      final ms = await Medicine.db.find(
        s,
        orderBy: (t) => t.id,
        transaction: tx,
      );
      if (hs.length != 3 ||
          hs.any((h) => h.organizationType != 'FICTIONAL_DEMO') ||
          ms.length != 4 ||
          ms.any((m) => !m.canonicalProductCode.startsWith('DEMO-BB-'))) {
        throw StateError(
          'Refusing restore: this is not the isolated three-hospital synthetic database.',
        );
      }
      for (final table in [
        'notifications',
        'audit_events',
        'transfer_events',
        'stock_reservations',
        'approvals',
        'rescue_proposals',
        'shortage_forecasts',
        'consumption_records',
      ]) {
        await s.db.unsafeExecute('DELETE FROM "$table"', transaction: tx);
      }
      final now = DateTime.now().toUtc();
      final today = DateTime.utc(now.year, now.month, now.day);
      final batches = await InventoryBatch.db.find(s, transaction: tx);
      for (final batch in batches) {
        if (!batch.batchNumber.startsWith('DEMO-')) {
          await InventoryBatch.db.deleteRow(s, batch, transaction: tx);
          continue;
        }
        final hi = hs.indexWhere((h) => h.id == batch.hospitalId),
            mi = ms.indexWhere((m) => m.id == batch.medicineId);
        final good = batch.batchNumber.endsWith('-GOOD');
        batch.quantityOnHand = good
            ? (mi == 0 ? [35, 500, 200][hi] : 350)
            : 100;
        batch.quantityReserved = 0;
        batch.expiryDate = today.add(
          Duration(
            days: batch.batchNumber.contains('EXPIRED')
                ? -1
                : batch.batchNumber.contains('NEAR_EXPIRY')
                ? 5
                : mi == 3
                ? 45
                : 180,
          ),
        );
        batch.version++;
        batch.lastUpdatedAt = now;
        await InventoryBatch.db.updateRow(s, batch, transaction: tx);
      }
      for (var hi = 0; hi < 3; hi++) {
        for (var mi = 0; mi < 4; mi++) {
          for (var day = 1; day <= 30; day++) {
            await ConsumptionRecord.db.insertRow(
              s,
              ConsumptionRecord(
                hospitalId: hs[hi].id!,
                medicineId: ms[mi].id!,
                date: today.subtract(Duration(days: day)),
                quantityUsed: mi == 0 ? [10, 4, 12][hi] : 2 + mi,
              ),
              transaction: tx,
            );
          }
        }
      }
      final inbound = await InboundSupply.db.find(s, transaction: tx);
      for (final i in inbound) {
        i.expectedArrivalDate = today.add(const Duration(days: 10));
        await InboundSupply.db.updateRow(s, i, transaction: tx);
      }
    });
    await BeaconService.publish(
      s,
      (await Hospital.db.find(s)).map((h) => h.id!),
      'DEMO_RESTORED',
    );
    stdout.writeln(
      'Synthetic demo restored. Accounts preserved; scenarios reset.',
    );
  } finally {
    await s.close();
    await pod.shutdown();
  }
}

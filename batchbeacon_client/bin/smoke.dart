import 'dart:async';
import 'package:batchbeacon_client/batchbeacon_client.dart';
// The generated client exposes the auth module as a transitive dependency.
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    hide Caller, Protocol;

class MemoryAuth implements ClientAuthSuccessStorage {
  AuthSuccess? value;
  @override
  Future<AuthSuccess?> get() async => value;
  @override
  Future<void> set(AuthSuccess? data) async {
    value = data;
  }
}

void check(bool condition, String message) {
  if (!condition) throw StateError(message);
  print('PASS: $message');
}

Future<void> main(List<String> args) async {
  final url = args.isEmpty ? 'http://localhost:8080/' : args.first;
  final a = Client(url)
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  final b = Client(url)
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  final c = Client(url)
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  StreamSubscription<BeaconEvent>? sub;
  try {
    await a.auth.updateSignedInUser(await a.demo.enter(0, 'PHARMACIST'));
    await b.auth.updateSignedInUser(await b.demo.enter(1, 'PHARMACIST'));
    await c.auth.updateSignedInUser(await c.demo.enter(2, 'PHARMACIST'));
    final ma = await a.beacon.me(), mb = await b.beacon.me();
    if (args.contains('--clean-pending')) {
      final pending = await a.beacon.dashboard(ma.hospitalId);
      for (final proposal in pending.proposals) {
        if (proposal.requestKey.startsWith('smoke-') &&
            [
              'PENDING_SOURCE_APPROVAL',
              'PENDING_DESTINATION_APPROVAL',
              'RESERVED',
            ].contains(proposal.status)) {
          await a.beacon.act(
            proposal.id!,
            'CANCEL',
            'Clean up interrupted synthetic network smoke.',
          );
        }
      }
    }
    final before = await a.beacon.dashboard(ma.hospitalId);
    final f = before.forecasts.firstWhere((f) => f.requiredQuantity > 0);
    check(f.requiredQuantity > 0, 'Real authenticated API shortage forecast');
    final options = await a.beacon.findRescueOptions(
      ma.hospitalId,
      f.medicineId,
    );
    check(options.any((o) => o.eligible), 'Eligible donor available');
    check(
      options.any((o) => o.hospitalName.contains('Riverside') && !o.eligible),
      'Riverside donor protected',
    );
    final candidate = options.firstWhere((o) => o.eligible);
    final p = await a.beacon.propose(
      ma.hospitalId,
      f.medicineId,
      candidate.batchId,
      'smoke-${DateTime.now().microsecondsSinceEpoch}',
    );
    final connected = Completer<void>(), updated = Completer<void>();
    sub = a.beacon.watch().listen((e) {
      if (e.category == 'CONNECTED' && !connected.isCompleted)
        connected.complete();
      if (e.category == 'TRANSFER' && !updated.isCompleted) updated.complete();
    });
    await connected.future.timeout(const Duration(seconds: 20));
    await b.beacon.act(
      p.id!,
      'APPROVE',
      'Network smoke: source pharmacist reviewed synthetic proposal.',
    );
    await updated.future.timeout(const Duration(seconds: 20));
    check(
      true,
      'Hospital A received source approval over authenticated WebSocket',
    );
    await a.beacon.act(
      p.id!,
      'APPROVE',
      'Network smoke: destination reviewed.',
    );
    final sourceBefore = await b.beacon.dashboard(mb.hospitalId);
    final held = sourceBefore.batches.firstWhere(
      (b) => b.id == p.inventoryBatchId,
    );
    check(
      held.quantityReserved >= p.proposedQuantity,
      'Reservation persisted in PostgreSQL',
    );
    await b.beacon.act(p.id!, 'DISPATCH', 'Simulated dispatch.');
    await a.beacon.act(p.id!, 'RECEIVE', 'Simulated receipt.');
    final after = await a.beacon.dashboard(ma.hospitalId);
    check(
      after.proposals.firstWhere((x) => x.id == p.id).status ==
          'RECEIVED_SIMULATED',
      'Full lifecycle completed through network API',
    );
    check(
      after.batches.any(
        (b) =>
            b.batchNumber.startsWith('BB-${p.id}-FROM-') &&
            b.quantityOnHand == p.proposedQuantity,
      ),
      'Receiving provenance and units reconcile',
    );
    check(
      after.audit.any(
        (e) => e.entityId == p.id && e.action == 'RECEIVED_SIMULATED',
      ),
      'Receipt audit persisted',
    );
    print('NETWORK_SMOKE_COMPLETE proposal=BB-${p.id} api=$url');
  } finally {
    await sub?.cancel();
    a.close();
    b.close();
    c.close();
  }
}

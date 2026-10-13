import 'dart:io';
import 'package:batchbeacon_client/batchbeacon_client.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    hide Caller, Protocol;
import 'smoke.dart' show MemoryAuth, check;

/// Read-only credential and role verification; never prints passwords/tokens.
Future<void> main(List<String> args) async {
  if (args.length != 2) {
    throw ArgumentError(
      'Usage: check_admin_access.dart <api-url> <password-file>',
    );
  }
  final password = File(args[1]).readAsStringSync().trim();
  for (final hospital in ['meridian', 'northstar', 'riverside']) {
    final email = '$hospital.hospital_administrator@demo.batchbeacon.invalid';
    final c = Client(args[0])
      ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
    try {
      await c.auth.updateSignedInUser(
        await c.emailIdp.login(email: email, password: password),
      );
      final me = await c.beacon.me();
      check(
        me.role == 'HOSPITAL_ADMINISTRATOR',
        '$email authenticates as hospital admin',
      );
      final dashboard = await c.beacon.dashboard(me.hospitalId);
      check(
        dashboard.hospital.id == me.hospitalId,
        'Own hospital dashboard and policy accessible',
      );
    } finally {
      c.close();
    }
  }
  final c = Client(args[0])
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  try {
    await c.auth.updateSignedInUser(
      await c.emailIdp.login(
        email: 'meridian.platform_administrator@demo.batchbeacon.invalid',
        password: password,
      ),
    );
    final me = await c.beacon.me();
    check(
      me.role == 'PLATFORM_ADMINISTRATOR',
      'Platform administrator login works',
    );
    final hospitals = await c.beacon.demoOrganizations();
    check(
      hospitals.length == 3,
      'All three fictional organizations accessible',
    );
    for (final hospital in hospitals) {
      await c.beacon.organizationAudit(hospital.id!);
    }
    check(true, 'Organization audit review accessible');
    var denied = false;
    try {
      await c.beacon.dashboard(me.hospitalId);
    } catch (_) {
      denied = true;
    }
    check(denied, 'Platform role does not inherit hospital inventory access');
  } finally {
    c.close();
  }
  for (var n = 0; n < 3; n++) {
    final c = Client(args[0])
      ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
    try {
      await c.auth.updateSignedInUser(await c.demo.enter(n, 'PHARMACIST'));
      final me = await c.beacon.me();
      await c.beacon.dashboard(me.hospitalId);
      check(
        me.role == 'PHARMACIST',
        'Existing demo hospital ${n + 1} login preserved',
      );
    } finally {
      c.close();
    }
  }
  print('ADMIN_ACCESS_VERIFIED api=${args[0]}');
}

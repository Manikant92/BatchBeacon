import 'dart:io';
import 'package:batchbeacon_client/batchbeacon_client.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    hide Caller, Protocol;
import 'smoke.dart' show MemoryAuth, check;

Future<T> cloudRead<T>(Future<T> Function() action) async {
  for (var attempt = 0; ; attempt++) {
    try {
      return await action();
    } on ServerpodClientUnknownHttpException catch (e) {
      if (e.statusCode != 503 || attempt >= 2) rethrow;
      print(
        'RETRY: Cloud ingress returned HTTP 503; retrying verification request.',
      );
      await Future<void>.delayed(Duration(seconds: 1 << attempt));
    }
  }
}

Future<AuthSuccess> login(
  Client c, {
  required String email,
  required String password,
}) => cloudRead(() => c.emailIdp.login(email: email, password: password));
Future<AuthSuccess> demoLogin(Client c, int n) =>
    cloudRead(() => c.demo.enter(n, 'PHARMACIST'));

Future<void> main(List<String> args) async {
  if (args.length != 2)
    throw ArgumentError(
      'Usage: check_clean_access.dart <api-url> <private-secret-directory>',
    );
  final platform = Client(args[0])
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  final hospital = Client(args[0])
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  final demo = Client(args[0])
    ..authSessionManager = ClientAuthSessionManager(storage: MemoryAuth());
  try {
    await hospital.auth.updateSignedInUser(
      await login(
        hospital,
        email: 'hospital.admin@batchbeacon.invalid',
        password: File(
          '${args[1]}/clean_hospital_password',
        ).readAsStringSync().trim(),
      ),
    );
    final member = await cloudRead(hospital.beacon.me);
    check(
      member.role == 'HOSPITAL_ADMINISTRATOR',
      'Clean hospital administrator authenticated',
    );
    final snapshot = await cloudRead(
      () => hospital.beacon.dashboard(member.hospitalId),
    );
    check(
      snapshot.hospital.organizationType == 'HOSPITAL',
      'Non-demo hospital workspace',
    );
    check(
      snapshot.medicines.isEmpty &&
          snapshot.batches.isEmpty &&
          snapshot.consumption.isEmpty &&
          snapshot.forecasts.isEmpty &&
          snapshot.proposals.isEmpty &&
          snapshot.events.isEmpty &&
          snapshot.audit.isEmpty &&
          snapshot.notifications.isEmpty,
      'No operational or simulated records in clean hospital',
    );
    await platform.auth.updateSignedInUser(
      await login(
        platform,
        email: 'platform.admin@batchbeacon.invalid',
        password: File(
          '${args[1]}/clean_platform_password',
        ).readAsStringSync().trim(),
      ),
    );
    final pm = await cloudRead(platform.beacon.me);
    check(
      pm.role == 'PLATFORM_ADMINISTRATOR',
      'Clean platform administrator authenticated',
    );
    final orgs = await cloudRead(platform.beacon.demoOrganizations);
    check(
      orgs.isNotEmpty &&
          orgs.every((h) => h.organizationType != 'FICTIONAL_DEMO'),
      'Platform excludes all demo organizations',
    );
    check(
      (await cloudRead(
        () => platform.beacon.organizationAudit(member.hospitalId),
      )).isEmpty,
      'Clean organization audit is empty',
    );
    for (var n = 0; n < 3; n++) {
      await demo.auth.updateSignedInUser(
        await demoLogin(demo, n),
      );
      final dm = await cloudRead(demo.beacon.me);
      await cloudRead(() => demo.beacon.dashboard(dm.hospitalId));
      var denied = false;
      try {
        await cloudRead(() => platform.beacon.organizationAudit(dm.hospitalId));
      } on ServerpodClientInternalServerError {
        denied = true;
      }
      check(
        denied,
        'Demo hospital ${n + 1} preserved and isolated from clean platform',
      );
      await cloudRead(demo.auth.signOutDevice);
    }
    print('CLEAN_ACCESS_VERIFIED api=${args[0]}');
  } finally {
    platform.close();
    hospital.close();
    demo.close();
  }
}

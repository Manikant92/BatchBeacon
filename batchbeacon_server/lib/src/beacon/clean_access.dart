import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import '../generated/protocol.dart';
import 'beacon_service.dart';

/// Provisions only identities and configuration, never operational/demo data.
class CleanAccess {
  static String? password(Session s, String key, String fileName) {
    final secret = s.serverpod.getPassword(key);
    if (secret != null && secret.length >= 32) return secret;
    if (s.serverpod.runMode == 'development') {
      final file = File('.serverpod/$fileName');
      if (file.existsSync()) return file.readAsStringSync().trim();
    }
    return null;
  }

  static Future<void> ensure(Session s) async {
    final platform = password(
      s,
      'cleanPlatformAdminPassword',
      'clean_platform_password',
    );
    final hospital = password(
      s,
      'cleanHospitalAdminPassword',
      'clean_hospital_password',
    );
    if (platform == null || hospital == null) return;
    if (platform.length < 32 || hospital.length < 32) {
      throw StateError(
        'Clean admin passwords must have at least 32 characters.',
      );
    }
    await s.db.transaction((tx) async {
      await BeaconService.lock(s, tx);
      var workspace = await Hospital.db.findFirstRow(
        s,
        where: (t) => t.name.equals('Hospital Workspace'),
        transaction: tx,
      );
      workspace ??= await Hospital.db.insertRow(
        s,
        Hospital(
          name: 'Hospital Workspace',
          city: '',
          organizationType: 'HOSPITAL',
          status: 'ACTIVE',
        ),
        transaction: tx,
      );
      if (workspace.organizationType != 'HOSPITAL') {
        throw StateError('Clean workspace name collision.');
      }
      if (await HospitalPolicy.db.findFirstRow(
            s,
            where: (t) => t.hospitalId.equals(workspace!.id!),
            transaction: tx,
          ) ==
          null) {
        await HospitalPolicy.db.insertRow(
          s,
          HospitalPolicy(
            hospitalId: workspace.id!,
            safetyStockDays: 7,
            minimumRemainingShelfLifeDays: 30,
            permittedShareCategories: [],
            transferApprovalRequired: true,
            transitDays: 1,
            forecastHorizonDays: 14,
          ),
          transaction: tx,
        );
      }
      final provider = AuthServices.getIdentityProvider<EmailIdp>();
      for (final entry in [
        (
          'platform.admin@batchbeacon.invalid',
          'PLATFORM_ADMINISTRATOR',
          platform,
        ),
        (
          'hospital.admin@batchbeacon.invalid',
          'HOSPITAL_ADMINISTRATOR',
          hospital,
        ),
      ]) {
        final existing = await provider.admin.findAccount(
          s,
          email: entry.$1,
          transaction: tx,
        );
        if (existing != null) {
          final membership = await HospitalUser.db.findFirstRow(
            s,
            where: (t) => t.authUserId.equals(existing.authUserId),
            transaction: tx,
          );
          if (membership?.hospitalId != workspace.id ||
              membership?.role != entry.$2) {
            throw StateError('Clean account membership mismatch.');
          }
          continue;
        }
        final user = await AuthServices.instance.authUsers.create(
          s,
          transaction: tx,
        );
        await provider.admin.createEmailAuthentication(
          s,
          authUserId: user.id,
          email: entry.$1,
          password: entry.$3,
          transaction: tx,
        );
        await HospitalUser.db.insertRow(
          s,
          HospitalUser(
            authUserId: user.id,
            hospitalId: workspace.id!,
            role: entry.$2,
            status: 'ACTIVE',
          ),
          transaction: tx,
        );
      }
    });
  }
}

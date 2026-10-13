import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import '../generated/protocol.dart';
import 'seed.dart';

/// Public access is restricted to isolated fictional accounts, never administrators.
class DemoEndpoint extends Endpoint {
  Future<AuthSuccess> enter(
    Session session,
    int hospitalIndex,
    String role,
  ) async {
    if (!DemoSeed.enabled(session) ||
        hospitalIndex < 0 ||
        hospitalIndex > 2 ||
        !['PHARMACIST', 'INVENTORY_MANAGER'].contains(role)) {
      throw StateError('Demo access denied.');
    }
    final hospitals = await Hospital.db.find(
      session,
      where: (t) => t.organizationType.equals('FICTIONAL_DEMO'),
      orderBy: (t) => t.id,
    );
    if (hospitals.length != 3 ||
        hospitals.any((h) => h.organizationType != 'FICTIONAL_DEMO')) {
      throw StateError('Demo dataset unavailable.');
    }
    return AuthServices.getIdentityProvider<EmailIdp>().login(
      session,
      email: DemoSeed.email(hospitalIndex, role),
      password: DemoSeed.password(session),
    );
  }
}

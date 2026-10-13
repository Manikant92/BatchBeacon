/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:batchbeacon_client/src/protocol/beacon/audit_event.dart'
    as _ivh3uhfo;
import 'package:batchbeacon_client/src/protocol/beacon/beacon_event.dart'
    as _i1fua4hu;
import 'package:batchbeacon_client/src/protocol/beacon/hospital.dart'
    as _ivvk4j8t;
import 'package:batchbeacon_client/src/protocol/beacon/hospital_user.dart'
    as _i7pte2lx;
import 'package:batchbeacon_client/src/protocol/beacon/rescue_candidate.dart'
    as _ig9szlqq;
import 'package:batchbeacon_client/src/protocol/beacon/rescue_proposal.dart'
    as _islihn0h;
import 'package:batchbeacon_client/src/protocol/beacon/workspace_snapshot.dart'
    as _ihmmzm6i;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// {@category Endpoint}
class EndpointBeacon extends _isc.EndpointRef {
  EndpointBeacon(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'beacon';

  _ida.Future<List<_ivvk4j8t.Hospital>> demoOrganizations() =>
      caller.callServerEndpoint<List<_ivvk4j8t.Hospital>>(
        'beacon',
        'demoOrganizations',
        {},
      );

  _ida.Future<List<_ivh3uhfo.AuditEvent>> organizationAudit(int hospitalId) =>
      caller.callServerEndpoint<List<_ivh3uhfo.AuditEvent>>(
        'beacon',
        'organizationAudit',
        {'hospitalId': hospitalId},
      );

  _ida.Future<void> setDemoOrganizationStatus(
    int hospitalId,
    String status,
  ) => caller.callServerEndpoint<void>(
    'beacon',
    'setDemoOrganizationStatus',
    {
      'hospitalId': hospitalId,
      'status': status,
    },
  );

  _ida.Future<_i7pte2lx.HospitalUser> me() =>
      caller.callServerEndpoint<_i7pte2lx.HospitalUser>(
        'beacon',
        'me',
        {},
      );

  _ida.Future<_ihmmzm6i.WorkspaceSnapshot> dashboard(int hospitalId) =>
      caller.callServerEndpoint<_ihmmzm6i.WorkspaceSnapshot>(
        'beacon',
        'dashboard',
        {'hospitalId': hospitalId},
      );

  _ida.Future<List<_ig9szlqq.RescueCandidate>> findRescueOptions(
    int hospitalId,
    int medicineId,
  ) => caller.callServerEndpoint<List<_ig9szlqq.RescueCandidate>>(
    'beacon',
    'findRescueOptions',
    {
      'hospitalId': hospitalId,
      'medicineId': medicineId,
    },
  );

  _ida.Future<_islihn0h.RescueProposal> propose(
    int hospitalId,
    int medicineId,
    int batchId,
    String requestKey,
  ) => caller.callServerEndpoint<_islihn0h.RescueProposal>(
    'beacon',
    'propose',
    {
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'batchId': batchId,
      'requestKey': requestKey,
    },
  );

  _ida.Future<_islihn0h.RescueProposal> act(
    int proposalId,
    String action,
    String note,
  ) => caller.callServerEndpoint<_islihn0h.RescueProposal>(
    'beacon',
    'act',
    {
      'proposalId': proposalId,
      'action': action,
      'note': note,
    },
  );

  _ida.Stream<_i1fua4hu.BeaconEvent> watch() =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i1fua4hu.BeaconEvent>,
        _i1fua4hu.BeaconEvent
      >(
        'beacon',
        'watch',
        {},
        {},
      );

  /// Atomic all-or-nothing CSV intake. Never updates quantities of reserved batches.
  _ida.Future<int> importInventory(
    int hospitalId,
    String csv,
  ) => caller.callServerEndpoint<int>(
    'beacon',
    'importInventory',
    {
      'hospitalId': hospitalId,
      'csv': csv,
    },
  );

  _ida.Future<void> recordConsumption(
    int hospitalId,
    int medicineId,
    DateTime date,
    int quantity,
  ) => caller.callServerEndpoint<void>(
    'beacon',
    'recordConsumption',
    {
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'date': date,
      'quantity': quantity,
    },
  );

  _ida.Future<void> updatePolicy(
    int hospitalId,
    int safetyDays,
    int transitDays,
    int shelfLifeDays,
    int horizonDays,
  ) => caller.callServerEndpoint<void>(
    'beacon',
    'updatePolicy',
    {
      'hospitalId': hospitalId,
      'safetyDays': safetyDays,
      'transitDays': transitDays,
      'shelfLifeDays': shelfLifeDays,
      'horizonDays': horizonDays,
    },
  );

  _ida.Future<String> investigate(
    int hospitalId,
    int medicineId,
  ) => caller.callServerEndpoint<String>(
    'beacon',
    'investigate',
    {
      'hospitalId': hospitalId,
      'medicineId': medicineId,
    },
  );
}

/// Public access is restricted to isolated fictional accounts, never administrators.
/// {@category Endpoint}
class EndpointDemo extends _isc.EndpointRef {
  EndpointDemo(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'demo';

  _ida.Future<_iacc.AuthSuccess> enter(
    int hospitalIndex,
    String role,
  ) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'demo',
    'enter',
    {
      'hospitalIndex': hospitalIndex,
      'role': role,
    },
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    beacon = EndpointBeacon(this);
    demo = EndpointDemo(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointBeacon beacon;

  late final EndpointDemo demo;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'beacon': beacon,
    'demo': demo,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}

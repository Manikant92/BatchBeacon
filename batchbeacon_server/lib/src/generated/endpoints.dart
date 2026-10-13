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
import 'package:batchbeacon_server/src/generated/future_calls.dart'
    as _i8s86aq2;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../beacon/beacon_endpoint.dart' as _idfr70gx;
import '../beacon/demo_endpoint.dart' as _ipngemd5;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'beacon': _idfr70gx.BeaconEndpoint()
        ..initialize(
          server,
          'beacon',
          null,
        ),
      'demo': _ipngemd5.DemoEndpoint()
        ..initialize(
          server,
          'demo',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['beacon'] = _is.EndpointConnector(
      name: 'beacon',
      endpoint: endpoints['beacon']!,
      methodConnectors: {
        'demoOrganizations': _is.MethodConnector(
          name: 'demoOrganizations',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .demoOrganizations(session),
        ),
        'organizationAudit': _is.MethodConnector(
          name: 'organizationAudit',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .organizationAudit(
                    session,
                    params['hospitalId'],
                  ),
        ),
        'setDemoOrganizationStatus': _is.MethodConnector(
          name: 'setDemoOrganizationStatus',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'status': _is.ParameterDescription(
              name: 'status',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .setDemoOrganizationStatus(
                    session,
                    params['hospitalId'],
                    params['status'],
                  ),
        ),
        'me': _is.MethodConnector(
          name: 'me',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).me(session),
        ),
        'dashboard': _is.MethodConnector(
          name: 'dashboard',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).dashboard(
                    session,
                    params['hospitalId'],
                  ),
        ),
        'findRescueOptions': _is.MethodConnector(
          name: 'findRescueOptions',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'medicineId': _is.ParameterDescription(
              name: 'medicineId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .findRescueOptions(
                    session,
                    params['hospitalId'],
                    params['medicineId'],
                  ),
        ),
        'propose': _is.MethodConnector(
          name: 'propose',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'medicineId': _is.ParameterDescription(
              name: 'medicineId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'batchId': _is.ParameterDescription(
              name: 'batchId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'requestKey': _is.ParameterDescription(
              name: 'requestKey',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).propose(
                    session,
                    params['hospitalId'],
                    params['medicineId'],
                    params['batchId'],
                    params['requestKey'],
                  ),
        ),
        'act': _is.MethodConnector(
          name: 'act',
          params: {
            'proposalId': _is.ParameterDescription(
              name: 'proposalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'action': _is.ParameterDescription(
              name: 'action',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'note': _is.ParameterDescription(
              name: 'note',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).act(
                session,
                params['proposalId'],
                params['action'],
                params['note'],
              ),
        ),
        'importInventory': _is.MethodConnector(
          name: 'importInventory',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'csv': _is.ParameterDescription(
              name: 'csv',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .importInventory(
                    session,
                    params['hospitalId'],
                    params['csv'],
                  ),
        ),
        'recordConsumption': _is.MethodConnector(
          name: 'recordConsumption',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'medicineId': _is.ParameterDescription(
              name: 'medicineId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'date': _is.ParameterDescription(
              name: 'date',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'quantity': _is.ParameterDescription(
              name: 'quantity',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .recordConsumption(
                    session,
                    params['hospitalId'],
                    params['medicineId'],
                    params['date'],
                    params['quantity'],
                  ),
        ),
        'updatePolicy': _is.MethodConnector(
          name: 'updatePolicy',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'safetyDays': _is.ParameterDescription(
              name: 'safetyDays',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'transitDays': _is.ParameterDescription(
              name: 'transitDays',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'shelfLifeDays': _is.ParameterDescription(
              name: 'shelfLifeDays',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'horizonDays': _is.ParameterDescription(
              name: 'horizonDays',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint)
                  .updatePolicy(
                    session,
                    params['hospitalId'],
                    params['safetyDays'],
                    params['transitDays'],
                    params['shelfLifeDays'],
                    params['horizonDays'],
                  ),
        ),
        'investigate': _is.MethodConnector(
          name: 'investigate',
          params: {
            'hospitalId': _is.ParameterDescription(
              name: 'hospitalId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'medicineId': _is.ParameterDescription(
              name: 'medicineId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).investigate(
                    session,
                    params['hospitalId'],
                    params['medicineId'],
                  ),
        ),
        'watch': _is.MethodStreamConnector(
          name: 'watch',
          params: {},
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['beacon'] as _idfr70gx.BeaconEndpoint).watch(
                session,
              ),
        ),
      },
    );
    connectors['demo'] = _is.EndpointConnector(
      name: 'demo',
      endpoint: endpoints['demo']!,
      methodConnectors: {
        'enter': _is.MethodConnector(
          name: 'enter',
          params: {
            'hospitalIndex': _is.ParameterDescription(
              name: 'hospitalIndex',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'role': _is.ParameterDescription(
              name: 'role',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['demo'] as _ipngemd5.DemoEndpoint).enter(
                session,
                params['hospitalIndex'],
                params['role'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }

  @override
  _is.FutureCallDispatch? get futureCalls {
    return _i8s86aq2.FutureCalls();
  }
}

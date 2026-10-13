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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class HospitalUser
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HospitalUser._({
    this.id,
    required this.authUserId,
    required this.hospitalId,
    required this.role,
    required this.status,
  });

  factory HospitalUser({
    int? id,
    required _isc.UuidValue authUserId,
    required int hospitalId,
    required String role,
    required String status,
  }) = _HospitalUserImpl;

  factory HospitalUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return HospitalUser(
      id: jsonSerialization['id'] as int?,
      authUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      hospitalId: jsonSerialization['hospitalId'] as int,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue authUserId;

  int hospitalId;

  String role;

  String status;

  /// Returns a shallow copy of this [HospitalUser]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HospitalUser copyWith({
    int? id,
    _isc.UuidValue? authUserId,
    int? hospitalId,
    String? role,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HospitalUser',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'hospitalId': hospitalId,
      'role': role,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HospitalUser',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'hospitalId': hospitalId,
      'role': role,
      'status': status,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HospitalUserImpl extends HospitalUser {
  _HospitalUserImpl({
    int? id,
    required _isc.UuidValue authUserId,
    required int hospitalId,
    required String role,
    required String status,
  }) : super._(
         id: id,
         authUserId: authUserId,
         hospitalId: hospitalId,
         role: role,
         status: status,
       );

  /// Returns a shallow copy of this [HospitalUser]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HospitalUser copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? authUserId,
    int? hospitalId,
    String? role,
    String? status,
  }) {
    return HospitalUser(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      hospitalId: hospitalId ?? this.hospitalId,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }
}

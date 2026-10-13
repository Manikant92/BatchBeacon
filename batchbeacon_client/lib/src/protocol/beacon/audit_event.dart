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

abstract class AuditEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AuditEvent._({
    this.id,
    required this.hospitalId,
    required this.actorId,
    required this.entityType,
    required this.entityId,
    required this.action,
    required this.timestamp,
    required this.previousState,
    required this.newState,
  });

  factory AuditEvent({
    int? id,
    required int hospitalId,
    required _isc.UuidValue actorId,
    required String entityType,
    required int entityId,
    required String action,
    required DateTime timestamp,
    required String previousState,
    required String newState,
  }) = _AuditEventImpl;

  factory AuditEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuditEvent(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      actorId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['actorId'],
      ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      action: jsonSerialization['action'] as String,
      timestamp: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      previousState: jsonSerialization['previousState'] as String,
      newState: jsonSerialization['newState'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  _isc.UuidValue actorId;

  String entityType;

  int entityId;

  String action;

  DateTime timestamp;

  String previousState;

  String newState;

  /// Returns a shallow copy of this [AuditEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AuditEvent copyWith({
    int? id,
    int? hospitalId,
    _isc.UuidValue? actorId,
    String? entityType,
    int? entityId,
    String? action,
    DateTime? timestamp,
    String? previousState,
    String? newState,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuditEvent',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'actorId': actorId.toJson(),
      'entityType': entityType,
      'entityId': entityId,
      'action': action,
      'timestamp': timestamp.toJson(),
      'previousState': previousState,
      'newState': newState,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuditEvent',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'actorId': actorId.toJson(),
      'entityType': entityType,
      'entityId': entityId,
      'action': action,
      'timestamp': timestamp.toJson(),
      'previousState': previousState,
      'newState': newState,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuditEventImpl extends AuditEvent {
  _AuditEventImpl({
    int? id,
    required int hospitalId,
    required _isc.UuidValue actorId,
    required String entityType,
    required int entityId,
    required String action,
    required DateTime timestamp,
    required String previousState,
    required String newState,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         actorId: actorId,
         entityType: entityType,
         entityId: entityId,
         action: action,
         timestamp: timestamp,
         previousState: previousState,
         newState: newState,
       );

  /// Returns a shallow copy of this [AuditEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AuditEvent copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    _isc.UuidValue? actorId,
    String? entityType,
    int? entityId,
    String? action,
    DateTime? timestamp,
    String? previousState,
    String? newState,
  }) {
    return AuditEvent(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      actorId: actorId ?? this.actorId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      timestamp: timestamp ?? this.timestamp,
      previousState: previousState ?? this.previousState,
      newState: newState ?? this.newState,
    );
  }
}

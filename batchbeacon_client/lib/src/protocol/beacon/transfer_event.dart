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

abstract class TransferEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TransferEvent._({
    this.id,
    required this.proposalId,
    required this.eventType,
    required this.actorId,
    required this.timestamp,
    required this.metadata,
  });

  factory TransferEvent({
    int? id,
    required int proposalId,
    required String eventType,
    required _isc.UuidValue actorId,
    required DateTime timestamp,
    required String metadata,
  }) = _TransferEventImpl;

  factory TransferEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TransferEvent(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      eventType: jsonSerialization['eventType'] as String,
      actorId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['actorId'],
      ),
      timestamp: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      metadata: jsonSerialization['metadata'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int proposalId;

  String eventType;

  _isc.UuidValue actorId;

  DateTime timestamp;

  String metadata;

  /// Returns a shallow copy of this [TransferEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TransferEvent copyWith({
    int? id,
    int? proposalId,
    String? eventType,
    _isc.UuidValue? actorId,
    DateTime? timestamp,
    String? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransferEvent',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'eventType': eventType,
      'actorId': actorId.toJson(),
      'timestamp': timestamp.toJson(),
      'metadata': metadata,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TransferEvent',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'eventType': eventType,
      'actorId': actorId.toJson(),
      'timestamp': timestamp.toJson(),
      'metadata': metadata,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransferEventImpl extends TransferEvent {
  _TransferEventImpl({
    int? id,
    required int proposalId,
    required String eventType,
    required _isc.UuidValue actorId,
    required DateTime timestamp,
    required String metadata,
  }) : super._(
         id: id,
         proposalId: proposalId,
         eventType: eventType,
         actorId: actorId,
         timestamp: timestamp,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [TransferEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TransferEvent copyWith({
    Object? id = _Undefined,
    int? proposalId,
    String? eventType,
    _isc.UuidValue? actorId,
    DateTime? timestamp,
    String? metadata,
  }) {
    return TransferEvent(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      eventType: eventType ?? this.eventType,
      actorId: actorId ?? this.actorId,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
    );
  }
}

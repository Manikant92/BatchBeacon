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

abstract class Approval
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Approval._({
    this.id,
    required this.proposalId,
    required this.hospitalId,
    required this.reviewerId,
    required this.decision,
    required this.timestamp,
    required this.note,
  });

  factory Approval({
    int? id,
    required int proposalId,
    required int hospitalId,
    required _isc.UuidValue reviewerId,
    required String decision,
    required DateTime timestamp,
    required String note,
  }) = _ApprovalImpl;

  factory Approval.fromJson(Map<String, dynamic> jsonSerialization) {
    return Approval(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      hospitalId: jsonSerialization['hospitalId'] as int,
      reviewerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['reviewerId'],
      ),
      decision: jsonSerialization['decision'] as String,
      timestamp: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      note: jsonSerialization['note'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int proposalId;

  int hospitalId;

  _isc.UuidValue reviewerId;

  String decision;

  DateTime timestamp;

  String note;

  /// Returns a shallow copy of this [Approval]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Approval copyWith({
    int? id,
    int? proposalId,
    int? hospitalId,
    _isc.UuidValue? reviewerId,
    String? decision,
    DateTime? timestamp,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Approval',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'hospitalId': hospitalId,
      'reviewerId': reviewerId.toJson(),
      'decision': decision,
      'timestamp': timestamp.toJson(),
      'note': note,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Approval',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'hospitalId': hospitalId,
      'reviewerId': reviewerId.toJson(),
      'decision': decision,
      'timestamp': timestamp.toJson(),
      'note': note,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApprovalImpl extends Approval {
  _ApprovalImpl({
    int? id,
    required int proposalId,
    required int hospitalId,
    required _isc.UuidValue reviewerId,
    required String decision,
    required DateTime timestamp,
    required String note,
  }) : super._(
         id: id,
         proposalId: proposalId,
         hospitalId: hospitalId,
         reviewerId: reviewerId,
         decision: decision,
         timestamp: timestamp,
         note: note,
       );

  /// Returns a shallow copy of this [Approval]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Approval copyWith({
    Object? id = _Undefined,
    int? proposalId,
    int? hospitalId,
    _isc.UuidValue? reviewerId,
    String? decision,
    DateTime? timestamp,
    String? note,
  }) {
    return Approval(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      hospitalId: hospitalId ?? this.hospitalId,
      reviewerId: reviewerId ?? this.reviewerId,
      decision: decision ?? this.decision,
      timestamp: timestamp ?? this.timestamp,
      note: note ?? this.note,
    );
  }
}

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
import 'package:serverpod/serverpod.dart' as _is;

abstract class RescueCandidate
    implements _is.SerializableModel, _is.ProtocolSerialization {
  RescueCandidate._({
    required this.hospitalName,
    required this.hospitalId,
    required this.batchId,
    required this.eligible,
    required this.maximumQuantity,
    required this.donorRetained,
    required this.reason,
    required this.expiryDate,
    required this.arrivalAt,
  });

  factory RescueCandidate({
    required String hospitalName,
    required int hospitalId,
    required int batchId,
    required bool eligible,
    required int maximumQuantity,
    required int donorRetained,
    required String reason,
    required DateTime expiryDate,
    required DateTime arrivalAt,
  }) = _RescueCandidateImpl;

  factory RescueCandidate.fromJson(Map<String, dynamic> jsonSerialization) {
    return RescueCandidate(
      hospitalName: jsonSerialization['hospitalName'] as String,
      hospitalId: jsonSerialization['hospitalId'] as int,
      batchId: jsonSerialization['batchId'] as int,
      eligible: _is.BoolJsonExtension.fromJson(jsonSerialization['eligible']),
      maximumQuantity: jsonSerialization['maximumQuantity'] as int,
      donorRetained: jsonSerialization['donorRetained'] as int,
      reason: jsonSerialization['reason'] as String,
      expiryDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiryDate'],
      ),
      arrivalAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['arrivalAt'],
      ),
    );
  }

  String hospitalName;

  int hospitalId;

  int batchId;

  bool eligible;

  int maximumQuantity;

  int donorRetained;

  String reason;

  DateTime expiryDate;

  DateTime arrivalAt;

  /// Returns a shallow copy of this [RescueCandidate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RescueCandidate copyWith({
    String? hospitalName,
    int? hospitalId,
    int? batchId,
    bool? eligible,
    int? maximumQuantity,
    int? donorRetained,
    String? reason,
    DateTime? expiryDate,
    DateTime? arrivalAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RescueCandidate',
      'hospitalName': hospitalName,
      'hospitalId': hospitalId,
      'batchId': batchId,
      'eligible': eligible,
      'maximumQuantity': maximumQuantity,
      'donorRetained': donorRetained,
      'reason': reason,
      'expiryDate': expiryDate.toJson(),
      'arrivalAt': arrivalAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RescueCandidate',
      'hospitalName': hospitalName,
      'hospitalId': hospitalId,
      'batchId': batchId,
      'eligible': eligible,
      'maximumQuantity': maximumQuantity,
      'donorRetained': donorRetained,
      'reason': reason,
      'expiryDate': expiryDate.toJson(),
      'arrivalAt': arrivalAt.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _RescueCandidateImpl extends RescueCandidate {
  _RescueCandidateImpl({
    required String hospitalName,
    required int hospitalId,
    required int batchId,
    required bool eligible,
    required int maximumQuantity,
    required int donorRetained,
    required String reason,
    required DateTime expiryDate,
    required DateTime arrivalAt,
  }) : super._(
         hospitalName: hospitalName,
         hospitalId: hospitalId,
         batchId: batchId,
         eligible: eligible,
         maximumQuantity: maximumQuantity,
         donorRetained: donorRetained,
         reason: reason,
         expiryDate: expiryDate,
         arrivalAt: arrivalAt,
       );

  /// Returns a shallow copy of this [RescueCandidate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RescueCandidate copyWith({
    String? hospitalName,
    int? hospitalId,
    int? batchId,
    bool? eligible,
    int? maximumQuantity,
    int? donorRetained,
    String? reason,
    DateTime? expiryDate,
    DateTime? arrivalAt,
  }) {
    return RescueCandidate(
      hospitalName: hospitalName ?? this.hospitalName,
      hospitalId: hospitalId ?? this.hospitalId,
      batchId: batchId ?? this.batchId,
      eligible: eligible ?? this.eligible,
      maximumQuantity: maximumQuantity ?? this.maximumQuantity,
      donorRetained: donorRetained ?? this.donorRetained,
      reason: reason ?? this.reason,
      expiryDate: expiryDate ?? this.expiryDate,
      arrivalAt: arrivalAt ?? this.arrivalAt,
    );
  }
}

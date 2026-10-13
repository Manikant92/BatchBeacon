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

abstract class RescueProposal
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RescueProposal._({
    this.id,
    required this.sourceHospitalId,
    required this.destinationHospitalId,
    required this.medicineId,
    required this.inventoryBatchId,
    required this.proposedQuantity,
    required this.expiryDate,
    required this.proposedArrivalAt,
    required this.status,
    required this.forecastReferenceId,
    required this.explanation,
    required this.requestKey,
    required this.createdAt,
  });

  factory RescueProposal({
    int? id,
    required int sourceHospitalId,
    required int destinationHospitalId,
    required int medicineId,
    required int inventoryBatchId,
    required int proposedQuantity,
    required DateTime expiryDate,
    required DateTime proposedArrivalAt,
    required String status,
    required int forecastReferenceId,
    required String explanation,
    required String requestKey,
    required DateTime createdAt,
  }) = _RescueProposalImpl;

  factory RescueProposal.fromJson(Map<String, dynamic> jsonSerialization) {
    return RescueProposal(
      id: jsonSerialization['id'] as int?,
      sourceHospitalId: jsonSerialization['sourceHospitalId'] as int,
      destinationHospitalId: jsonSerialization['destinationHospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      inventoryBatchId: jsonSerialization['inventoryBatchId'] as int,
      proposedQuantity: jsonSerialization['proposedQuantity'] as int,
      expiryDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiryDate'],
      ),
      proposedArrivalAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['proposedArrivalAt'],
      ),
      status: jsonSerialization['status'] as String,
      forecastReferenceId: jsonSerialization['forecastReferenceId'] as int,
      explanation: jsonSerialization['explanation'] as String,
      requestKey: jsonSerialization['requestKey'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int sourceHospitalId;

  int destinationHospitalId;

  int medicineId;

  int inventoryBatchId;

  int proposedQuantity;

  DateTime expiryDate;

  DateTime proposedArrivalAt;

  String status;

  int forecastReferenceId;

  String explanation;

  String requestKey;

  DateTime createdAt;

  /// Returns a shallow copy of this [RescueProposal]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RescueProposal copyWith({
    int? id,
    int? sourceHospitalId,
    int? destinationHospitalId,
    int? medicineId,
    int? inventoryBatchId,
    int? proposedQuantity,
    DateTime? expiryDate,
    DateTime? proposedArrivalAt,
    String? status,
    int? forecastReferenceId,
    String? explanation,
    String? requestKey,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RescueProposal',
      if (id != null) 'id': id,
      'sourceHospitalId': sourceHospitalId,
      'destinationHospitalId': destinationHospitalId,
      'medicineId': medicineId,
      'inventoryBatchId': inventoryBatchId,
      'proposedQuantity': proposedQuantity,
      'expiryDate': expiryDate.toJson(),
      'proposedArrivalAt': proposedArrivalAt.toJson(),
      'status': status,
      'forecastReferenceId': forecastReferenceId,
      'explanation': explanation,
      'requestKey': requestKey,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RescueProposal',
      if (id != null) 'id': id,
      'sourceHospitalId': sourceHospitalId,
      'destinationHospitalId': destinationHospitalId,
      'medicineId': medicineId,
      'inventoryBatchId': inventoryBatchId,
      'proposedQuantity': proposedQuantity,
      'expiryDate': expiryDate.toJson(),
      'proposedArrivalAt': proposedArrivalAt.toJson(),
      'status': status,
      'forecastReferenceId': forecastReferenceId,
      'explanation': explanation,
      'requestKey': requestKey,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RescueProposalImpl extends RescueProposal {
  _RescueProposalImpl({
    int? id,
    required int sourceHospitalId,
    required int destinationHospitalId,
    required int medicineId,
    required int inventoryBatchId,
    required int proposedQuantity,
    required DateTime expiryDate,
    required DateTime proposedArrivalAt,
    required String status,
    required int forecastReferenceId,
    required String explanation,
    required String requestKey,
    required DateTime createdAt,
  }) : super._(
         id: id,
         sourceHospitalId: sourceHospitalId,
         destinationHospitalId: destinationHospitalId,
         medicineId: medicineId,
         inventoryBatchId: inventoryBatchId,
         proposedQuantity: proposedQuantity,
         expiryDate: expiryDate,
         proposedArrivalAt: proposedArrivalAt,
         status: status,
         forecastReferenceId: forecastReferenceId,
         explanation: explanation,
         requestKey: requestKey,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RescueProposal]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RescueProposal copyWith({
    Object? id = _Undefined,
    int? sourceHospitalId,
    int? destinationHospitalId,
    int? medicineId,
    int? inventoryBatchId,
    int? proposedQuantity,
    DateTime? expiryDate,
    DateTime? proposedArrivalAt,
    String? status,
    int? forecastReferenceId,
    String? explanation,
    String? requestKey,
    DateTime? createdAt,
  }) {
    return RescueProposal(
      id: id is int? ? id : this.id,
      sourceHospitalId: sourceHospitalId ?? this.sourceHospitalId,
      destinationHospitalId:
          destinationHospitalId ?? this.destinationHospitalId,
      medicineId: medicineId ?? this.medicineId,
      inventoryBatchId: inventoryBatchId ?? this.inventoryBatchId,
      proposedQuantity: proposedQuantity ?? this.proposedQuantity,
      expiryDate: expiryDate ?? this.expiryDate,
      proposedArrivalAt: proposedArrivalAt ?? this.proposedArrivalAt,
      status: status ?? this.status,
      forecastReferenceId: forecastReferenceId ?? this.forecastReferenceId,
      explanation: explanation ?? this.explanation,
      requestKey: requestKey ?? this.requestKey,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

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

abstract class InboundSupply
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  InboundSupply._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.quantity,
    required this.expectedArrivalDate,
    required this.confirmationStatus,
  });

  factory InboundSupply({
    int? id,
    required int hospitalId,
    required int medicineId,
    required int quantity,
    required DateTime expectedArrivalDate,
    required String confirmationStatus,
  }) = _InboundSupplyImpl;

  factory InboundSupply.fromJson(Map<String, dynamic> jsonSerialization) {
    return InboundSupply(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      expectedArrivalDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expectedArrivalDate'],
      ),
      confirmationStatus: jsonSerialization['confirmationStatus'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  int medicineId;

  int quantity;

  DateTime expectedArrivalDate;

  String confirmationStatus;

  /// Returns a shallow copy of this [InboundSupply]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  InboundSupply copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    int? quantity,
    DateTime? expectedArrivalDate,
    String? confirmationStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InboundSupply',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'quantity': quantity,
      'expectedArrivalDate': expectedArrivalDate.toJson(),
      'confirmationStatus': confirmationStatus,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InboundSupply',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'quantity': quantity,
      'expectedArrivalDate': expectedArrivalDate.toJson(),
      'confirmationStatus': confirmationStatus,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InboundSupplyImpl extends InboundSupply {
  _InboundSupplyImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required int quantity,
    required DateTime expectedArrivalDate,
    required String confirmationStatus,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         quantity: quantity,
         expectedArrivalDate: expectedArrivalDate,
         confirmationStatus: confirmationStatus,
       );

  /// Returns a shallow copy of this [InboundSupply]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  InboundSupply copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    int? quantity,
    DateTime? expectedArrivalDate,
    String? confirmationStatus,
  }) {
    return InboundSupply(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      quantity: quantity ?? this.quantity,
      expectedArrivalDate: expectedArrivalDate ?? this.expectedArrivalDate,
      confirmationStatus: confirmationStatus ?? this.confirmationStatus,
    );
  }
}

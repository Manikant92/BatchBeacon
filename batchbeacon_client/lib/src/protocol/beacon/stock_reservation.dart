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

abstract class StockReservation
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  StockReservation._({
    this.id,
    required this.proposalId,
    required this.inventoryBatchId,
    required this.quantity,
    required this.status,
    required this.expiresAt,
  });

  factory StockReservation({
    int? id,
    required int proposalId,
    required int inventoryBatchId,
    required int quantity,
    required String status,
    required DateTime expiresAt,
  }) = _StockReservationImpl;

  factory StockReservation.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockReservation(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      inventoryBatchId: jsonSerialization['inventoryBatchId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      status: jsonSerialization['status'] as String,
      expiresAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int proposalId;

  int inventoryBatchId;

  int quantity;

  String status;

  DateTime expiresAt;

  /// Returns a shallow copy of this [StockReservation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StockReservation copyWith({
    int? id,
    int? proposalId,
    int? inventoryBatchId,
    int? quantity,
    String? status,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StockReservation',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'inventoryBatchId': inventoryBatchId,
      'quantity': quantity,
      'status': status,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StockReservation',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'inventoryBatchId': inventoryBatchId,
      'quantity': quantity,
      'status': status,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StockReservationImpl extends StockReservation {
  _StockReservationImpl({
    int? id,
    required int proposalId,
    required int inventoryBatchId,
    required int quantity,
    required String status,
    required DateTime expiresAt,
  }) : super._(
         id: id,
         proposalId: proposalId,
         inventoryBatchId: inventoryBatchId,
         quantity: quantity,
         status: status,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [StockReservation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  StockReservation copyWith({
    Object? id = _Undefined,
    int? proposalId,
    int? inventoryBatchId,
    int? quantity,
    String? status,
    DateTime? expiresAt,
  }) {
    return StockReservation(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      inventoryBatchId: inventoryBatchId ?? this.inventoryBatchId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

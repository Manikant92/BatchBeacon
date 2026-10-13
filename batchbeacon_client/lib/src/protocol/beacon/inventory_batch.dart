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

abstract class InventoryBatch
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  InventoryBatch._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.batchNumber,
    required this.quantityOnHand,
    required this.quantityReserved,
    required this.expiryDate,
    required this.storageStatus,
    required this.qualityStatus,
    required this.lastUpdatedAt,
    required this.version,
  });

  factory InventoryBatch({
    int? id,
    required int hospitalId,
    required int medicineId,
    required String batchNumber,
    required int quantityOnHand,
    required int quantityReserved,
    required DateTime expiryDate,
    required String storageStatus,
    required String qualityStatus,
    required DateTime lastUpdatedAt,
    required int version,
  }) = _InventoryBatchImpl;

  factory InventoryBatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return InventoryBatch(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      batchNumber: jsonSerialization['batchNumber'] as String,
      quantityOnHand: jsonSerialization['quantityOnHand'] as int,
      quantityReserved: jsonSerialization['quantityReserved'] as int,
      expiryDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiryDate'],
      ),
      storageStatus: jsonSerialization['storageStatus'] as String,
      qualityStatus: jsonSerialization['qualityStatus'] as String,
      lastUpdatedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastUpdatedAt'],
      ),
      version: jsonSerialization['version'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  int medicineId;

  String batchNumber;

  int quantityOnHand;

  int quantityReserved;

  DateTime expiryDate;

  String storageStatus;

  String qualityStatus;

  DateTime lastUpdatedAt;

  int version;

  /// Returns a shallow copy of this [InventoryBatch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  InventoryBatch copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    String? batchNumber,
    int? quantityOnHand,
    int? quantityReserved,
    DateTime? expiryDate,
    String? storageStatus,
    String? qualityStatus,
    DateTime? lastUpdatedAt,
    int? version,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InventoryBatch',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'batchNumber': batchNumber,
      'quantityOnHand': quantityOnHand,
      'quantityReserved': quantityReserved,
      'expiryDate': expiryDate.toJson(),
      'storageStatus': storageStatus,
      'qualityStatus': qualityStatus,
      'lastUpdatedAt': lastUpdatedAt.toJson(),
      'version': version,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InventoryBatch',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'batchNumber': batchNumber,
      'quantityOnHand': quantityOnHand,
      'quantityReserved': quantityReserved,
      'expiryDate': expiryDate.toJson(),
      'storageStatus': storageStatus,
      'qualityStatus': qualityStatus,
      'lastUpdatedAt': lastUpdatedAt.toJson(),
      'version': version,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InventoryBatchImpl extends InventoryBatch {
  _InventoryBatchImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required String batchNumber,
    required int quantityOnHand,
    required int quantityReserved,
    required DateTime expiryDate,
    required String storageStatus,
    required String qualityStatus,
    required DateTime lastUpdatedAt,
    required int version,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         batchNumber: batchNumber,
         quantityOnHand: quantityOnHand,
         quantityReserved: quantityReserved,
         expiryDate: expiryDate,
         storageStatus: storageStatus,
         qualityStatus: qualityStatus,
         lastUpdatedAt: lastUpdatedAt,
         version: version,
       );

  /// Returns a shallow copy of this [InventoryBatch]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  InventoryBatch copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    String? batchNumber,
    int? quantityOnHand,
    int? quantityReserved,
    DateTime? expiryDate,
    String? storageStatus,
    String? qualityStatus,
    DateTime? lastUpdatedAt,
    int? version,
  }) {
    return InventoryBatch(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      batchNumber: batchNumber ?? this.batchNumber,
      quantityOnHand: quantityOnHand ?? this.quantityOnHand,
      quantityReserved: quantityReserved ?? this.quantityReserved,
      expiryDate: expiryDate ?? this.expiryDate,
      storageStatus: storageStatus ?? this.storageStatus,
      qualityStatus: qualityStatus ?? this.qualityStatus,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      version: version ?? this.version,
    );
  }
}

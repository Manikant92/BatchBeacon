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

abstract class ConsumptionRecord
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ConsumptionRecord._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.date,
    required this.quantityUsed,
  });

  factory ConsumptionRecord({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime date,
    required int quantityUsed,
  }) = _ConsumptionRecordImpl;

  factory ConsumptionRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConsumptionRecord(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      date: _isc.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      quantityUsed: jsonSerialization['quantityUsed'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  int medicineId;

  DateTime date;

  int quantityUsed;

  /// Returns a shallow copy of this [ConsumptionRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ConsumptionRecord copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    DateTime? date,
    int? quantityUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ConsumptionRecord',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'date': date.toJson(),
      'quantityUsed': quantityUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ConsumptionRecord',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'date': date.toJson(),
      'quantityUsed': quantityUsed,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConsumptionRecordImpl extends ConsumptionRecord {
  _ConsumptionRecordImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime date,
    required int quantityUsed,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         date: date,
         quantityUsed: quantityUsed,
       );

  /// Returns a shallow copy of this [ConsumptionRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ConsumptionRecord copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    DateTime? date,
    int? quantityUsed,
  }) {
    return ConsumptionRecord(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      date: date ?? this.date,
      quantityUsed: quantityUsed ?? this.quantityUsed,
    );
  }
}

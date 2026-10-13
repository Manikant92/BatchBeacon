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
import 'package:batchbeacon_client/src/protocol/protocol.dart' as _izxlspw4;
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class HospitalPolicy
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HospitalPolicy._({
    this.id,
    required this.hospitalId,
    required this.safetyStockDays,
    required this.minimumRemainingShelfLifeDays,
    required this.permittedShareCategories,
    required this.transferApprovalRequired,
    required this.transitDays,
    required this.forecastHorizonDays,
  });

  factory HospitalPolicy({
    int? id,
    required int hospitalId,
    required int safetyStockDays,
    required int minimumRemainingShelfLifeDays,
    required List<String> permittedShareCategories,
    required bool transferApprovalRequired,
    required int transitDays,
    required int forecastHorizonDays,
  }) = _HospitalPolicyImpl;

  factory HospitalPolicy.fromJson(Map<String, dynamic> jsonSerialization) {
    return HospitalPolicy(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      safetyStockDays: jsonSerialization['safetyStockDays'] as int,
      minimumRemainingShelfLifeDays:
          jsonSerialization['minimumRemainingShelfLifeDays'] as int,
      permittedShareCategories: _izxlspw4.Protocol().deserialize<List<String>>(
        jsonSerialization['permittedShareCategories'],
      ),
      transferApprovalRequired: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['transferApprovalRequired'],
      ),
      transitDays: jsonSerialization['transitDays'] as int,
      forecastHorizonDays: jsonSerialization['forecastHorizonDays'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  int safetyStockDays;

  int minimumRemainingShelfLifeDays;

  List<String> permittedShareCategories;

  bool transferApprovalRequired;

  int transitDays;

  int forecastHorizonDays;

  /// Returns a shallow copy of this [HospitalPolicy]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HospitalPolicy copyWith({
    int? id,
    int? hospitalId,
    int? safetyStockDays,
    int? minimumRemainingShelfLifeDays,
    List<String>? permittedShareCategories,
    bool? transferApprovalRequired,
    int? transitDays,
    int? forecastHorizonDays,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HospitalPolicy',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'safetyStockDays': safetyStockDays,
      'minimumRemainingShelfLifeDays': minimumRemainingShelfLifeDays,
      'permittedShareCategories': permittedShareCategories.toJson(),
      'transferApprovalRequired': transferApprovalRequired,
      'transitDays': transitDays,
      'forecastHorizonDays': forecastHorizonDays,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HospitalPolicy',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'safetyStockDays': safetyStockDays,
      'minimumRemainingShelfLifeDays': minimumRemainingShelfLifeDays,
      'permittedShareCategories': permittedShareCategories.toJson(),
      'transferApprovalRequired': transferApprovalRequired,
      'transitDays': transitDays,
      'forecastHorizonDays': forecastHorizonDays,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HospitalPolicyImpl extends HospitalPolicy {
  _HospitalPolicyImpl({
    int? id,
    required int hospitalId,
    required int safetyStockDays,
    required int minimumRemainingShelfLifeDays,
    required List<String> permittedShareCategories,
    required bool transferApprovalRequired,
    required int transitDays,
    required int forecastHorizonDays,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         safetyStockDays: safetyStockDays,
         minimumRemainingShelfLifeDays: minimumRemainingShelfLifeDays,
         permittedShareCategories: permittedShareCategories,
         transferApprovalRequired: transferApprovalRequired,
         transitDays: transitDays,
         forecastHorizonDays: forecastHorizonDays,
       );

  /// Returns a shallow copy of this [HospitalPolicy]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HospitalPolicy copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? safetyStockDays,
    int? minimumRemainingShelfLifeDays,
    List<String>? permittedShareCategories,
    bool? transferApprovalRequired,
    int? transitDays,
    int? forecastHorizonDays,
  }) {
    return HospitalPolicy(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      safetyStockDays: safetyStockDays ?? this.safetyStockDays,
      minimumRemainingShelfLifeDays:
          minimumRemainingShelfLifeDays ?? this.minimumRemainingShelfLifeDays,
      permittedShareCategories:
          permittedShareCategories ??
          this.permittedShareCategories.map((e0) => e0).toList(),
      transferApprovalRequired:
          transferApprovalRequired ?? this.transferApprovalRequired,
      transitDays: transitDays ?? this.transitDays,
      forecastHorizonDays: forecastHorizonDays ?? this.forecastHorizonDays,
    );
  }
}

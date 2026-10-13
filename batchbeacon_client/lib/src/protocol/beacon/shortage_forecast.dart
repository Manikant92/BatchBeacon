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

abstract class ShortageForecast
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ShortageForecast._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.calculatedAt,
    required this.averageDailyConsumption,
    this.projectedRunoutDate,
    required this.daysOfCover,
    required this.requiredQuantity,
    required this.riskLevel,
    required this.forecastMethod,
  });

  factory ShortageForecast({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime calculatedAt,
    required double averageDailyConsumption,
    DateTime? projectedRunoutDate,
    required double daysOfCover,
    required int requiredQuantity,
    required String riskLevel,
    required String forecastMethod,
  }) = _ShortageForecastImpl;

  factory ShortageForecast.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShortageForecast(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      calculatedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['calculatedAt'],
      ),
      averageDailyConsumption:
          (jsonSerialization['averageDailyConsumption'] as num).toDouble(),
      projectedRunoutDate: jsonSerialization['projectedRunoutDate'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['projectedRunoutDate'],
            ),
      daysOfCover: (jsonSerialization['daysOfCover'] as num).toDouble(),
      requiredQuantity: jsonSerialization['requiredQuantity'] as int,
      riskLevel: jsonSerialization['riskLevel'] as String,
      forecastMethod: jsonSerialization['forecastMethod'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int hospitalId;

  int medicineId;

  DateTime calculatedAt;

  double averageDailyConsumption;

  DateTime? projectedRunoutDate;

  double daysOfCover;

  int requiredQuantity;

  String riskLevel;

  String forecastMethod;

  /// Returns a shallow copy of this [ShortageForecast]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ShortageForecast copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    DateTime? calculatedAt,
    double? averageDailyConsumption,
    DateTime? projectedRunoutDate,
    double? daysOfCover,
    int? requiredQuantity,
    String? riskLevel,
    String? forecastMethod,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShortageForecast',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'calculatedAt': calculatedAt.toJson(),
      'averageDailyConsumption': averageDailyConsumption,
      if (projectedRunoutDate != null)
        'projectedRunoutDate': projectedRunoutDate?.toJson(),
      'daysOfCover': daysOfCover,
      'requiredQuantity': requiredQuantity,
      'riskLevel': riskLevel,
      'forecastMethod': forecastMethod,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShortageForecast',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'calculatedAt': calculatedAt.toJson(),
      'averageDailyConsumption': averageDailyConsumption,
      if (projectedRunoutDate != null)
        'projectedRunoutDate': projectedRunoutDate?.toJson(),
      'daysOfCover': daysOfCover,
      'requiredQuantity': requiredQuantity,
      'riskLevel': riskLevel,
      'forecastMethod': forecastMethod,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShortageForecastImpl extends ShortageForecast {
  _ShortageForecastImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime calculatedAt,
    required double averageDailyConsumption,
    DateTime? projectedRunoutDate,
    required double daysOfCover,
    required int requiredQuantity,
    required String riskLevel,
    required String forecastMethod,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         calculatedAt: calculatedAt,
         averageDailyConsumption: averageDailyConsumption,
         projectedRunoutDate: projectedRunoutDate,
         daysOfCover: daysOfCover,
         requiredQuantity: requiredQuantity,
         riskLevel: riskLevel,
         forecastMethod: forecastMethod,
       );

  /// Returns a shallow copy of this [ShortageForecast]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ShortageForecast copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    DateTime? calculatedAt,
    double? averageDailyConsumption,
    Object? projectedRunoutDate = _Undefined,
    double? daysOfCover,
    int? requiredQuantity,
    String? riskLevel,
    String? forecastMethod,
  }) {
    return ShortageForecast(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      calculatedAt: calculatedAt ?? this.calculatedAt,
      averageDailyConsumption:
          averageDailyConsumption ?? this.averageDailyConsumption,
      projectedRunoutDate: projectedRunoutDate is DateTime?
          ? projectedRunoutDate
          : this.projectedRunoutDate,
      daysOfCover: daysOfCover ?? this.daysOfCover,
      requiredQuantity: requiredQuantity ?? this.requiredQuantity,
      riskLevel: riskLevel ?? this.riskLevel,
      forecastMethod: forecastMethod ?? this.forecastMethod,
    );
  }
}

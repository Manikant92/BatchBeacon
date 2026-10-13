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

abstract class Medicine
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Medicine._({
    this.id,
    required this.canonicalProductCode,
    required this.displayName,
    required this.manufacturer,
    required this.strength,
    required this.dosageForm,
    required this.packSize,
    required this.storageCategory,
    required this.demoRegulatoryClass,
  });

  factory Medicine({
    int? id,
    required String canonicalProductCode,
    required String displayName,
    required String manufacturer,
    required String strength,
    required String dosageForm,
    required int packSize,
    required String storageCategory,
    required String demoRegulatoryClass,
  }) = _MedicineImpl;

  factory Medicine.fromJson(Map<String, dynamic> jsonSerialization) {
    return Medicine(
      id: jsonSerialization['id'] as int?,
      canonicalProductCode: jsonSerialization['canonicalProductCode'] as String,
      displayName: jsonSerialization['displayName'] as String,
      manufacturer: jsonSerialization['manufacturer'] as String,
      strength: jsonSerialization['strength'] as String,
      dosageForm: jsonSerialization['dosageForm'] as String,
      packSize: jsonSerialization['packSize'] as int,
      storageCategory: jsonSerialization['storageCategory'] as String,
      demoRegulatoryClass: jsonSerialization['demoRegulatoryClass'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String canonicalProductCode;

  String displayName;

  String manufacturer;

  String strength;

  String dosageForm;

  int packSize;

  String storageCategory;

  String demoRegulatoryClass;

  /// Returns a shallow copy of this [Medicine]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Medicine copyWith({
    int? id,
    String? canonicalProductCode,
    String? displayName,
    String? manufacturer,
    String? strength,
    String? dosageForm,
    int? packSize,
    String? storageCategory,
    String? demoRegulatoryClass,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Medicine',
      if (id != null) 'id': id,
      'canonicalProductCode': canonicalProductCode,
      'displayName': displayName,
      'manufacturer': manufacturer,
      'strength': strength,
      'dosageForm': dosageForm,
      'packSize': packSize,
      'storageCategory': storageCategory,
      'demoRegulatoryClass': demoRegulatoryClass,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Medicine',
      if (id != null) 'id': id,
      'canonicalProductCode': canonicalProductCode,
      'displayName': displayName,
      'manufacturer': manufacturer,
      'strength': strength,
      'dosageForm': dosageForm,
      'packSize': packSize,
      'storageCategory': storageCategory,
      'demoRegulatoryClass': demoRegulatoryClass,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MedicineImpl extends Medicine {
  _MedicineImpl({
    int? id,
    required String canonicalProductCode,
    required String displayName,
    required String manufacturer,
    required String strength,
    required String dosageForm,
    required int packSize,
    required String storageCategory,
    required String demoRegulatoryClass,
  }) : super._(
         id: id,
         canonicalProductCode: canonicalProductCode,
         displayName: displayName,
         manufacturer: manufacturer,
         strength: strength,
         dosageForm: dosageForm,
         packSize: packSize,
         storageCategory: storageCategory,
         demoRegulatoryClass: demoRegulatoryClass,
       );

  /// Returns a shallow copy of this [Medicine]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Medicine copyWith({
    Object? id = _Undefined,
    String? canonicalProductCode,
    String? displayName,
    String? manufacturer,
    String? strength,
    String? dosageForm,
    int? packSize,
    String? storageCategory,
    String? demoRegulatoryClass,
  }) {
    return Medicine(
      id: id is int? ? id : this.id,
      canonicalProductCode: canonicalProductCode ?? this.canonicalProductCode,
      displayName: displayName ?? this.displayName,
      manufacturer: manufacturer ?? this.manufacturer,
      strength: strength ?? this.strength,
      dosageForm: dosageForm ?? this.dosageForm,
      packSize: packSize ?? this.packSize,
      storageCategory: storageCategory ?? this.storageCategory,
      demoRegulatoryClass: demoRegulatoryClass ?? this.demoRegulatoryClass,
    );
  }
}

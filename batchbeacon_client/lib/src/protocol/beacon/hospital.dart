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

abstract class Hospital
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Hospital._({
    this.id,
    required this.name,
    required this.city,
    required this.organizationType,
    required this.status,
  });

  factory Hospital({
    int? id,
    required String name,
    required String city,
    required String organizationType,
    required String status,
  }) = _HospitalImpl;

  factory Hospital.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hospital(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      city: jsonSerialization['city'] as String,
      organizationType: jsonSerialization['organizationType'] as String,
      status: jsonSerialization['status'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String city;

  String organizationType;

  String status;

  /// Returns a shallow copy of this [Hospital]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Hospital copyWith({
    int? id,
    String? name,
    String? city,
    String? organizationType,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Hospital',
      if (id != null) 'id': id,
      'name': name,
      'city': city,
      'organizationType': organizationType,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Hospital',
      if (id != null) 'id': id,
      'name': name,
      'city': city,
      'organizationType': organizationType,
      'status': status,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HospitalImpl extends Hospital {
  _HospitalImpl({
    int? id,
    required String name,
    required String city,
    required String organizationType,
    required String status,
  }) : super._(
         id: id,
         name: name,
         city: city,
         organizationType: organizationType,
         status: status,
       );

  /// Returns a shallow copy of this [Hospital]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Hospital copyWith({
    Object? id = _Undefined,
    String? name,
    String? city,
    String? organizationType,
    String? status,
  }) {
    return Hospital(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      organizationType: organizationType ?? this.organizationType,
      status: status ?? this.status,
    );
  }
}

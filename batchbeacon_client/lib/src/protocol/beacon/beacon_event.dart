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

abstract class BeaconEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BeaconEvent._({
    required this.hospitalId,
    required this.category,
    required this.timestamp,
  });

  factory BeaconEvent({
    required int hospitalId,
    required String category,
    required DateTime timestamp,
  }) = _BeaconEventImpl;

  factory BeaconEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return BeaconEvent(
      hospitalId: jsonSerialization['hospitalId'] as int,
      category: jsonSerialization['category'] as String,
      timestamp: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
    );
  }

  int hospitalId;

  String category;

  DateTime timestamp;

  /// Returns a shallow copy of this [BeaconEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BeaconEvent copyWith({
    int? hospitalId,
    String? category,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BeaconEvent',
      'hospitalId': hospitalId,
      'category': category,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BeaconEvent',
      'hospitalId': hospitalId,
      'category': category,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _BeaconEventImpl extends BeaconEvent {
  _BeaconEventImpl({
    required int hospitalId,
    required String category,
    required DateTime timestamp,
  }) : super._(
         hospitalId: hospitalId,
         category: category,
         timestamp: timestamp,
       );

  /// Returns a shallow copy of this [BeaconEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BeaconEvent copyWith({
    int? hospitalId,
    String? category,
    DateTime? timestamp,
  }) {
    return BeaconEvent(
      hospitalId: hospitalId ?? this.hospitalId,
      category: category ?? this.category,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

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
import 'package:serverpod/serverpod.dart' as _is;

abstract class ReservationFutureCallExpireReservationModel
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ReservationFutureCallExpireReservationModel._({required this.proposalId});

  factory ReservationFutureCallExpireReservationModel({
    required int proposalId,
  }) = _ReservationFutureCallExpireReservationModelImpl;

  factory ReservationFutureCallExpireReservationModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ReservationFutureCallExpireReservationModel(
      proposalId: jsonSerialization['proposalId'] as int,
    );
  }

  int proposalId;

  /// Returns a shallow copy of this [ReservationFutureCallExpireReservationModel]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ReservationFutureCallExpireReservationModel copyWith({int? proposalId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReservationFutureCallExpireReservationModel',
      'proposalId': proposalId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _ReservationFutureCallExpireReservationModelImpl
    extends ReservationFutureCallExpireReservationModel {
  _ReservationFutureCallExpireReservationModelImpl({required int proposalId})
    : super._(proposalId: proposalId);

  /// Returns a shallow copy of this [ReservationFutureCallExpireReservationModel]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ReservationFutureCallExpireReservationModel copyWith({int? proposalId}) {
    return ReservationFutureCallExpireReservationModel(
      proposalId: proposalId ?? this.proposalId,
    );
  }
}

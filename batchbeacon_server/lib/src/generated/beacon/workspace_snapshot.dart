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
import 'package:batchbeacon_server/src/generated/protocol.dart' as _iti2zmxd;
import 'package:serverpod/serverpod.dart' as _is;
import '../beacon/audit_event.dart' as _ixbqixsv;
import '../beacon/consumption_record.dart' as _ilotcotw;
import '../beacon/hospital.dart' as _imql073m;
import '../beacon/hospital_policy.dart' as _ilbpwnbl;
import '../beacon/hospital_user.dart' as _isa4kmz6;
import '../beacon/inventory_batch.dart' as _i3tf83ey;
import '../beacon/medicine.dart' as _ic7yuo0x;
import '../beacon/notification.dart' as _i47xpo2s;
import '../beacon/rescue_proposal.dart' as _iev0dkhz;
import '../beacon/shortage_forecast.dart' as _ibou6ewj;
import '../beacon/transfer_event.dart' as _i7wjzhv8;

abstract class WorkspaceSnapshot
    implements _is.SerializableModel, _is.ProtocolSerialization {
  WorkspaceSnapshot._({
    required this.hospital,
    required this.membership,
    required this.policy,
    required this.medicines,
    required this.batches,
    required this.consumption,
    required this.forecasts,
    required this.proposals,
    required this.events,
    required this.audit,
    required this.notifications,
  });

  factory WorkspaceSnapshot({
    required _imql073m.Hospital hospital,
    required _isa4kmz6.HospitalUser membership,
    required _ilbpwnbl.HospitalPolicy policy,
    required List<_ic7yuo0x.Medicine> medicines,
    required List<_i3tf83ey.InventoryBatch> batches,
    required List<_ilotcotw.ConsumptionRecord> consumption,
    required List<_ibou6ewj.ShortageForecast> forecasts,
    required List<_iev0dkhz.RescueProposal> proposals,
    required List<_i7wjzhv8.TransferEvent> events,
    required List<_ixbqixsv.AuditEvent> audit,
    required List<_i47xpo2s.Notification> notifications,
  }) = _WorkspaceSnapshotImpl;

  factory WorkspaceSnapshot.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorkspaceSnapshot(
      hospital: _iti2zmxd.Protocol().deserialize<_imql073m.Hospital>(
        jsonSerialization['hospital'],
      ),
      membership: _iti2zmxd.Protocol().deserialize<_isa4kmz6.HospitalUser>(
        jsonSerialization['membership'],
      ),
      policy: _iti2zmxd.Protocol().deserialize<_ilbpwnbl.HospitalPolicy>(
        jsonSerialization['policy'],
      ),
      medicines: _iti2zmxd.Protocol().deserialize<List<_ic7yuo0x.Medicine>>(
        jsonSerialization['medicines'],
      ),
      batches: _iti2zmxd.Protocol().deserialize<List<_i3tf83ey.InventoryBatch>>(
        jsonSerialization['batches'],
      ),
      consumption: _iti2zmxd.Protocol()
          .deserialize<List<_ilotcotw.ConsumptionRecord>>(
            jsonSerialization['consumption'],
          ),
      forecasts: _iti2zmxd.Protocol()
          .deserialize<List<_ibou6ewj.ShortageForecast>>(
            jsonSerialization['forecasts'],
          ),
      proposals: _iti2zmxd.Protocol()
          .deserialize<List<_iev0dkhz.RescueProposal>>(
            jsonSerialization['proposals'],
          ),
      events: _iti2zmxd.Protocol().deserialize<List<_i7wjzhv8.TransferEvent>>(
        jsonSerialization['events'],
      ),
      audit: _iti2zmxd.Protocol().deserialize<List<_ixbqixsv.AuditEvent>>(
        jsonSerialization['audit'],
      ),
      notifications: _iti2zmxd.Protocol()
          .deserialize<List<_i47xpo2s.Notification>>(
            jsonSerialization['notifications'],
          ),
    );
  }

  _imql073m.Hospital hospital;

  _isa4kmz6.HospitalUser membership;

  _ilbpwnbl.HospitalPolicy policy;

  List<_ic7yuo0x.Medicine> medicines;

  List<_i3tf83ey.InventoryBatch> batches;

  List<_ilotcotw.ConsumptionRecord> consumption;

  List<_ibou6ewj.ShortageForecast> forecasts;

  List<_iev0dkhz.RescueProposal> proposals;

  List<_i7wjzhv8.TransferEvent> events;

  List<_ixbqixsv.AuditEvent> audit;

  List<_i47xpo2s.Notification> notifications;

  /// Returns a shallow copy of this [WorkspaceSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  WorkspaceSnapshot copyWith({
    _imql073m.Hospital? hospital,
    _isa4kmz6.HospitalUser? membership,
    _ilbpwnbl.HospitalPolicy? policy,
    List<_ic7yuo0x.Medicine>? medicines,
    List<_i3tf83ey.InventoryBatch>? batches,
    List<_ilotcotw.ConsumptionRecord>? consumption,
    List<_ibou6ewj.ShortageForecast>? forecasts,
    List<_iev0dkhz.RescueProposal>? proposals,
    List<_i7wjzhv8.TransferEvent>? events,
    List<_ixbqixsv.AuditEvent>? audit,
    List<_i47xpo2s.Notification>? notifications,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceSnapshot',
      'hospital': hospital.toJson(),
      'membership': membership.toJson(),
      'policy': policy.toJson(),
      'medicines': medicines.toJson(valueToJson: (v) => v.toJson()),
      'batches': batches.toJson(valueToJson: (v) => v.toJson()),
      'consumption': consumption.toJson(valueToJson: (v) => v.toJson()),
      'forecasts': forecasts.toJson(valueToJson: (v) => v.toJson()),
      'proposals': proposals.toJson(valueToJson: (v) => v.toJson()),
      'events': events.toJson(valueToJson: (v) => v.toJson()),
      'audit': audit.toJson(valueToJson: (v) => v.toJson()),
      'notifications': notifications.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WorkspaceSnapshot',
      'hospital': hospital.toJsonForProtocol(),
      'membership': membership.toJsonForProtocol(),
      'policy': policy.toJsonForProtocol(),
      'medicines': medicines.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'batches': batches.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'consumption': consumption.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'forecasts': forecasts.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'proposals': proposals.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'events': events.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'audit': audit.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'notifications': notifications.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _WorkspaceSnapshotImpl extends WorkspaceSnapshot {
  _WorkspaceSnapshotImpl({
    required _imql073m.Hospital hospital,
    required _isa4kmz6.HospitalUser membership,
    required _ilbpwnbl.HospitalPolicy policy,
    required List<_ic7yuo0x.Medicine> medicines,
    required List<_i3tf83ey.InventoryBatch> batches,
    required List<_ilotcotw.ConsumptionRecord> consumption,
    required List<_ibou6ewj.ShortageForecast> forecasts,
    required List<_iev0dkhz.RescueProposal> proposals,
    required List<_i7wjzhv8.TransferEvent> events,
    required List<_ixbqixsv.AuditEvent> audit,
    required List<_i47xpo2s.Notification> notifications,
  }) : super._(
         hospital: hospital,
         membership: membership,
         policy: policy,
         medicines: medicines,
         batches: batches,
         consumption: consumption,
         forecasts: forecasts,
         proposals: proposals,
         events: events,
         audit: audit,
         notifications: notifications,
       );

  /// Returns a shallow copy of this [WorkspaceSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  WorkspaceSnapshot copyWith({
    _imql073m.Hospital? hospital,
    _isa4kmz6.HospitalUser? membership,
    _ilbpwnbl.HospitalPolicy? policy,
    List<_ic7yuo0x.Medicine>? medicines,
    List<_i3tf83ey.InventoryBatch>? batches,
    List<_ilotcotw.ConsumptionRecord>? consumption,
    List<_ibou6ewj.ShortageForecast>? forecasts,
    List<_iev0dkhz.RescueProposal>? proposals,
    List<_i7wjzhv8.TransferEvent>? events,
    List<_ixbqixsv.AuditEvent>? audit,
    List<_i47xpo2s.Notification>? notifications,
  }) {
    return WorkspaceSnapshot(
      hospital: hospital ?? this.hospital.copyWith(),
      membership: membership ?? this.membership.copyWith(),
      policy: policy ?? this.policy.copyWith(),
      medicines:
          medicines ?? this.medicines.map((e0) => e0.copyWith()).toList(),
      batches: batches ?? this.batches.map((e0) => e0.copyWith()).toList(),
      consumption:
          consumption ?? this.consumption.map((e0) => e0.copyWith()).toList(),
      forecasts:
          forecasts ?? this.forecasts.map((e0) => e0.copyWith()).toList(),
      proposals:
          proposals ?? this.proposals.map((e0) => e0.copyWith()).toList(),
      events: events ?? this.events.map((e0) => e0.copyWith()).toList(),
      audit: audit ?? this.audit.map((e0) => e0.copyWith()).toList(),
      notifications:
          notifications ??
          this.notifications.map((e0) => e0.copyWith()).toList(),
    );
  }
}

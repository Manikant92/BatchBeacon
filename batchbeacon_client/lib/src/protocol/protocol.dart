/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:batchbeacon_client/src/protocol/beacon/audit_event.dart'
    as _ivh3uhfo;
import 'package:batchbeacon_client/src/protocol/beacon/hospital.dart'
    as _ivvk4j8t;
import 'package:batchbeacon_client/src/protocol/beacon/rescue_candidate.dart'
    as _ig9szlqq;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'beacon/approval.dart' as _idmm8sdb;
import 'beacon/audit_event.dart' as _i6c4y87k;
import 'beacon/beacon_event.dart' as _ij03weui;
import 'beacon/consumption_record.dart' as _icim58h8;
import 'beacon/hospital.dart' as _ip2t2lv0;
import 'beacon/hospital_policy.dart' as _i5fzn4zj;
import 'beacon/hospital_user.dart' as _iertzni5;
import 'beacon/inbound_supply.dart' as _ig0ebxc6;
import 'beacon/inventory_batch.dart' as _imfm9gtk;
import 'beacon/medicine.dart' as _ivjabzzb;
import 'beacon/notification.dart' as _iislkj0w;
import 'beacon/rescue_candidate.dart' as _idah9k82;
import 'beacon/rescue_proposal.dart' as _iiwkqagb;
import 'beacon/shortage_forecast.dart' as _il2s7gfw;
import 'beacon/stock_reservation.dart' as _im5es8m7;
import 'beacon/transfer_event.dart' as _i7muwql4;
import 'beacon/workspace_snapshot.dart' as _i5b0thhu;
export 'beacon/approval.dart';
export 'beacon/audit_event.dart';
export 'beacon/beacon_event.dart';
export 'beacon/consumption_record.dart';
export 'beacon/hospital.dart';
export 'beacon/hospital_policy.dart';
export 'beacon/hospital_user.dart';
export 'beacon/inbound_supply.dart';
export 'beacon/inventory_batch.dart';
export 'beacon/medicine.dart';
export 'beacon/notification.dart';
export 'beacon/rescue_candidate.dart';
export 'beacon/rescue_proposal.dart';
export 'beacon/shortage_forecast.dart';
export 'beacon/stock_reservation.dart';
export 'beacon/transfer_event.dart';
export 'beacon/workspace_snapshot.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _idmm8sdb.Approval) {
      return _idmm8sdb.Approval.fromJson(data) as T;
    }
    if (t == _i6c4y87k.AuditEvent) {
      return _i6c4y87k.AuditEvent.fromJson(data) as T;
    }
    if (t == _ij03weui.BeaconEvent) {
      return _ij03weui.BeaconEvent.fromJson(data) as T;
    }
    if (t == _icim58h8.ConsumptionRecord) {
      return _icim58h8.ConsumptionRecord.fromJson(data) as T;
    }
    if (t == _ip2t2lv0.Hospital) {
      return _ip2t2lv0.Hospital.fromJson(data) as T;
    }
    if (t == _i5fzn4zj.HospitalPolicy) {
      return _i5fzn4zj.HospitalPolicy.fromJson(data) as T;
    }
    if (t == _iertzni5.HospitalUser) {
      return _iertzni5.HospitalUser.fromJson(data) as T;
    }
    if (t == _ig0ebxc6.InboundSupply) {
      return _ig0ebxc6.InboundSupply.fromJson(data) as T;
    }
    if (t == _imfm9gtk.InventoryBatch) {
      return _imfm9gtk.InventoryBatch.fromJson(data) as T;
    }
    if (t == _ivjabzzb.Medicine) {
      return _ivjabzzb.Medicine.fromJson(data) as T;
    }
    if (t == _iislkj0w.Notification) {
      return _iislkj0w.Notification.fromJson(data) as T;
    }
    if (t == _idah9k82.RescueCandidate) {
      return _idah9k82.RescueCandidate.fromJson(data) as T;
    }
    if (t == _iiwkqagb.RescueProposal) {
      return _iiwkqagb.RescueProposal.fromJson(data) as T;
    }
    if (t == _il2s7gfw.ShortageForecast) {
      return _il2s7gfw.ShortageForecast.fromJson(data) as T;
    }
    if (t == _im5es8m7.StockReservation) {
      return _im5es8m7.StockReservation.fromJson(data) as T;
    }
    if (t == _i7muwql4.TransferEvent) {
      return _i7muwql4.TransferEvent.fromJson(data) as T;
    }
    if (t == _i5b0thhu.WorkspaceSnapshot) {
      return _i5b0thhu.WorkspaceSnapshot.fromJson(data) as T;
    }
    if (t == _isc.getType<_idmm8sdb.Approval?>()) {
      return (data != null ? _idmm8sdb.Approval.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i6c4y87k.AuditEvent?>()) {
      return (data != null ? _i6c4y87k.AuditEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ij03weui.BeaconEvent?>()) {
      return (data != null ? _ij03weui.BeaconEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_icim58h8.ConsumptionRecord?>()) {
      return (data != null ? _icim58h8.ConsumptionRecord.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ip2t2lv0.Hospital?>()) {
      return (data != null ? _ip2t2lv0.Hospital.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i5fzn4zj.HospitalPolicy?>()) {
      return (data != null ? _i5fzn4zj.HospitalPolicy.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iertzni5.HospitalUser?>()) {
      return (data != null ? _iertzni5.HospitalUser.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ig0ebxc6.InboundSupply?>()) {
      return (data != null ? _ig0ebxc6.InboundSupply.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_imfm9gtk.InventoryBatch?>()) {
      return (data != null ? _imfm9gtk.InventoryBatch.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ivjabzzb.Medicine?>()) {
      return (data != null ? _ivjabzzb.Medicine.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iislkj0w.Notification?>()) {
      return (data != null ? _iislkj0w.Notification.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_idah9k82.RescueCandidate?>()) {
      return (data != null ? _idah9k82.RescueCandidate.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iiwkqagb.RescueProposal?>()) {
      return (data != null ? _iiwkqagb.RescueProposal.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_il2s7gfw.ShortageForecast?>()) {
      return (data != null ? _il2s7gfw.ShortageForecast.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_im5es8m7.StockReservation?>()) {
      return (data != null ? _im5es8m7.StockReservation.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i7muwql4.TransferEvent?>()) {
      return (data != null ? _i7muwql4.TransferEvent.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i5b0thhu.WorkspaceSnapshot?>()) {
      return (data != null ? _i5b0thhu.WorkspaceSnapshot.fromJson(data) : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ivjabzzb.Medicine>) {
      return (data as List)
              .map((e) => deserialize<_ivjabzzb.Medicine>(e))
              .toList()
          as T;
    }
    if (t == List<_imfm9gtk.InventoryBatch>) {
      return (data as List)
              .map((e) => deserialize<_imfm9gtk.InventoryBatch>(e))
              .toList()
          as T;
    }
    if (t == List<_icim58h8.ConsumptionRecord>) {
      return (data as List)
              .map((e) => deserialize<_icim58h8.ConsumptionRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_il2s7gfw.ShortageForecast>) {
      return (data as List)
              .map((e) => deserialize<_il2s7gfw.ShortageForecast>(e))
              .toList()
          as T;
    }
    if (t == List<_iiwkqagb.RescueProposal>) {
      return (data as List)
              .map((e) => deserialize<_iiwkqagb.RescueProposal>(e))
              .toList()
          as T;
    }
    if (t == List<_i7muwql4.TransferEvent>) {
      return (data as List)
              .map((e) => deserialize<_i7muwql4.TransferEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_i6c4y87k.AuditEvent>) {
      return (data as List)
              .map((e) => deserialize<_i6c4y87k.AuditEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_iislkj0w.Notification>) {
      return (data as List)
              .map((e) => deserialize<_iislkj0w.Notification>(e))
              .toList()
          as T;
    }
    if (t == List<_ivvk4j8t.Hospital>) {
      return (data as List)
              .map((e) => deserialize<_ivvk4j8t.Hospital>(e))
              .toList()
          as T;
    }
    if (t == List<_ivh3uhfo.AuditEvent>) {
      return (data as List)
              .map((e) => deserialize<_ivh3uhfo.AuditEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_ig9szlqq.RescueCandidate>) {
      return (data as List)
              .map((e) => deserialize<_ig9szlqq.RescueCandidate>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _idmm8sdb.Approval => 'Approval',
      _i6c4y87k.AuditEvent => 'AuditEvent',
      _ij03weui.BeaconEvent => 'BeaconEvent',
      _icim58h8.ConsumptionRecord => 'ConsumptionRecord',
      _ip2t2lv0.Hospital => 'Hospital',
      _i5fzn4zj.HospitalPolicy => 'HospitalPolicy',
      _iertzni5.HospitalUser => 'HospitalUser',
      _ig0ebxc6.InboundSupply => 'InboundSupply',
      _imfm9gtk.InventoryBatch => 'InventoryBatch',
      _ivjabzzb.Medicine => 'Medicine',
      _iislkj0w.Notification => 'Notification',
      _idah9k82.RescueCandidate => 'RescueCandidate',
      _iiwkqagb.RescueProposal => 'RescueProposal',
      _il2s7gfw.ShortageForecast => 'ShortageForecast',
      _im5es8m7.StockReservation => 'StockReservation',
      _i7muwql4.TransferEvent => 'TransferEvent',
      _i5b0thhu.WorkspaceSnapshot => 'WorkspaceSnapshot',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('batchbeacon.', '');
    }

    switch (data) {
      case _idmm8sdb.Approval():
        return 'Approval';
      case _i6c4y87k.AuditEvent():
        return 'AuditEvent';
      case _ij03weui.BeaconEvent():
        return 'BeaconEvent';
      case _icim58h8.ConsumptionRecord():
        return 'ConsumptionRecord';
      case _ip2t2lv0.Hospital():
        return 'Hospital';
      case _i5fzn4zj.HospitalPolicy():
        return 'HospitalPolicy';
      case _iertzni5.HospitalUser():
        return 'HospitalUser';
      case _ig0ebxc6.InboundSupply():
        return 'InboundSupply';
      case _imfm9gtk.InventoryBatch():
        return 'InventoryBatch';
      case _ivjabzzb.Medicine():
        return 'Medicine';
      case _iislkj0w.Notification():
        return 'Notification';
      case _idah9k82.RescueCandidate():
        return 'RescueCandidate';
      case _iiwkqagb.RescueProposal():
        return 'RescueProposal';
      case _il2s7gfw.ShortageForecast():
        return 'ShortageForecast';
      case _im5es8m7.StockReservation():
        return 'StockReservation';
      case _i7muwql4.TransferEvent():
        return 'TransferEvent';
      case _i5b0thhu.WorkspaceSnapshot():
        return 'WorkspaceSnapshot';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Approval') {
      return deserialize<_idmm8sdb.Approval>(data['data']);
    }
    if (dataClassName == 'AuditEvent') {
      return deserialize<_i6c4y87k.AuditEvent>(data['data']);
    }
    if (dataClassName == 'BeaconEvent') {
      return deserialize<_ij03weui.BeaconEvent>(data['data']);
    }
    if (dataClassName == 'ConsumptionRecord') {
      return deserialize<_icim58h8.ConsumptionRecord>(data['data']);
    }
    if (dataClassName == 'Hospital') {
      return deserialize<_ip2t2lv0.Hospital>(data['data']);
    }
    if (dataClassName == 'HospitalPolicy') {
      return deserialize<_i5fzn4zj.HospitalPolicy>(data['data']);
    }
    if (dataClassName == 'HospitalUser') {
      return deserialize<_iertzni5.HospitalUser>(data['data']);
    }
    if (dataClassName == 'InboundSupply') {
      return deserialize<_ig0ebxc6.InboundSupply>(data['data']);
    }
    if (dataClassName == 'InventoryBatch') {
      return deserialize<_imfm9gtk.InventoryBatch>(data['data']);
    }
    if (dataClassName == 'Medicine') {
      return deserialize<_ivjabzzb.Medicine>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_iislkj0w.Notification>(data['data']);
    }
    if (dataClassName == 'RescueCandidate') {
      return deserialize<_idah9k82.RescueCandidate>(data['data']);
    }
    if (dataClassName == 'RescueProposal') {
      return deserialize<_iiwkqagb.RescueProposal>(data['data']);
    }
    if (dataClassName == 'ShortageForecast') {
      return deserialize<_il2s7gfw.ShortageForecast>(data['data']);
    }
    if (dataClassName == 'StockReservation') {
      return deserialize<_im5es8m7.StockReservation>(data['data']);
    }
    if (dataClassName == 'TransferEvent') {
      return deserialize<_i7muwql4.TransferEvent>(data['data']);
    }
    if (dataClassName == 'WorkspaceSnapshot') {
      return deserialize<_i5b0thhu.WorkspaceSnapshot>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('batchbeacon', this);
    _iacc.Protocol().registerHostProtocol('batchbeacon', this);
  }

  @override
  String getModuleName() => 'batchbeacon';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

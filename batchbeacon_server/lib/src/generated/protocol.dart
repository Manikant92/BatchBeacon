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
import 'package:batchbeacon_server/src/generated/beacon/audit_event.dart'
    as _igngxdck;
import 'package:batchbeacon_server/src/generated/beacon/hospital.dart'
    as _i54fwjz6;
import 'package:batchbeacon_server/src/generated/beacon/rescue_candidate.dart'
    as _iu0v92hx;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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
import 'future_calls_generated_models/reservation_future_call_expire_reservation_model.dart'
    as _ikeiwuzw;
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

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'approvals',
      dartName: 'Approval',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'proposalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'reviewerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'decision',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'timestamp',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'note',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'approvals_fk_0',
          columns: ['proposalId'],
          referenceTable: 'rescue_proposals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'approvals_fk_1',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'approval_side',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'proposalId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'hospitalId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'audit_events',
      dartName: 'AuditEvent',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'actorId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'entityType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entityId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'action',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'timestamp',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'previousState',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'newState',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'audit_events_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'consumption_records',
      dartName: 'ConsumptionRecord',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'medicineId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'date',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'quantityUsed',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'consumption_records_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'consumption_records_fk_1',
          columns: ['medicineId'],
          referenceTable: 'medicines',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'consumption_day',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'hospitalId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'medicineId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'hospital_policies',
      dartName: 'HospitalPolicy',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'safetyStockDays',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'minimumRemainingShelfLifeDays',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'permittedShareCategories',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _isp.ColumnDefinition(
          name: 'transferApprovalRequired',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'transitDays',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'forecastHorizonDays',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'hospital_policies_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'policy_hospital',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'hospitalId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'hospital_users',
      dartName: 'HospitalUser',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'authUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'hospital_users_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'membership_auth',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'hospitals',
      dartName: 'Hospital',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'city',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'organizationType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'hospital_name',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'inbound_supplies',
      dartName: 'InboundSupply',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'medicineId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'expectedArrivalDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'confirmationStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'inbound_supplies_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'inbound_supplies_fk_1',
          columns: ['medicineId'],
          referenceTable: 'medicines',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'inventory_batches',
      dartName: 'InventoryBatch',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'medicineId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'batchNumber',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'quantityOnHand',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'quantityReserved',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'expiryDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'storageStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'qualityStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'lastUpdatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'version',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'inventory_batches_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'inventory_batches_fk_1',
          columns: ['medicineId'],
          referenceTable: 'medicines',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'batch_identity',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'hospitalId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'medicineId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'batchNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'medicines',
      dartName: 'Medicine',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'canonicalProductCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'manufacturer',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'strength',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'dosageForm',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'packSize',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'storageCategory',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'demoRegulatoryClass',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'product_code',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'canonicalProductCode',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'notifications',
      dartName: 'Notification',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'isRead',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'notifications_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'rescue_proposals',
      dartName: 'RescueProposal',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'sourceHospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'destinationHospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'medicineId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'inventoryBatchId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'proposedQuantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'expiryDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'proposedArrivalAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'forecastReferenceId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'explanation',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'requestKey',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'rescue_proposals_fk_0',
          columns: ['sourceHospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'rescue_proposals_fk_1',
          columns: ['destinationHospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'rescue_proposals_fk_2',
          columns: ['medicineId'],
          referenceTable: 'medicines',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'rescue_proposals_fk_3',
          columns: ['inventoryBatchId'],
          referenceTable: 'inventory_batches',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'rescue_proposals_fk_4',
          columns: ['forecastReferenceId'],
          referenceTable: 'shortage_forecasts',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'proposal_request',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'destinationHospitalId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'requestKey',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'shortage_forecasts',
      dartName: 'ShortageForecast',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'hospitalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'medicineId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'calculatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'averageDailyConsumption',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'projectedRunoutDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'daysOfCover',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'requiredQuantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'riskLevel',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'forecastMethod',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'shortage_forecasts_fk_0',
          columns: ['hospitalId'],
          referenceTable: 'hospitals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'shortage_forecasts_fk_1',
          columns: ['medicineId'],
          referenceTable: 'medicines',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'stock_reservations',
      dartName: 'StockReservation',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'proposalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'inventoryBatchId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'expiresAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'stock_reservations_fk_0',
          columns: ['proposalId'],
          referenceTable: 'rescue_proposals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'stock_reservations_fk_1',
          columns: ['inventoryBatchId'],
          referenceTable: 'inventory_batches',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'reservation_proposal',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'proposalId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'transfer_events',
      dartName: 'TransferEvent',
      schema: 'public',
      module: 'batchbeacon',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'proposalId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'eventType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'actorId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'timestamp',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'metadata',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'transfer_events_fk_0',
          columns: ['proposalId'],
          referenceTable: 'rescue_proposals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _ikeiwuzw.ReservationFutureCallExpireReservationModel) {
      return _ikeiwuzw.ReservationFutureCallExpireReservationModel.fromJson(
            data,
          )
          as T;
    }
    if (t == _is.getType<_idmm8sdb.Approval?>()) {
      return (data != null ? _idmm8sdb.Approval.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i6c4y87k.AuditEvent?>()) {
      return (data != null ? _i6c4y87k.AuditEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ij03weui.BeaconEvent?>()) {
      return (data != null ? _ij03weui.BeaconEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_icim58h8.ConsumptionRecord?>()) {
      return (data != null ? _icim58h8.ConsumptionRecord.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ip2t2lv0.Hospital?>()) {
      return (data != null ? _ip2t2lv0.Hospital.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i5fzn4zj.HospitalPolicy?>()) {
      return (data != null ? _i5fzn4zj.HospitalPolicy.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iertzni5.HospitalUser?>()) {
      return (data != null ? _iertzni5.HospitalUser.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ig0ebxc6.InboundSupply?>()) {
      return (data != null ? _ig0ebxc6.InboundSupply.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_imfm9gtk.InventoryBatch?>()) {
      return (data != null ? _imfm9gtk.InventoryBatch.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ivjabzzb.Medicine?>()) {
      return (data != null ? _ivjabzzb.Medicine.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iislkj0w.Notification?>()) {
      return (data != null ? _iislkj0w.Notification.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_idah9k82.RescueCandidate?>()) {
      return (data != null ? _idah9k82.RescueCandidate.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iiwkqagb.RescueProposal?>()) {
      return (data != null ? _iiwkqagb.RescueProposal.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_il2s7gfw.ShortageForecast?>()) {
      return (data != null ? _il2s7gfw.ShortageForecast.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_im5es8m7.StockReservation?>()) {
      return (data != null ? _im5es8m7.StockReservation.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i7muwql4.TransferEvent?>()) {
      return (data != null ? _i7muwql4.TransferEvent.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i5b0thhu.WorkspaceSnapshot?>()) {
      return (data != null ? _i5b0thhu.WorkspaceSnapshot.fromJson(data) : null)
          as T;
    }
    if (t ==
        _is.getType<_ikeiwuzw.ReservationFutureCallExpireReservationModel?>()) {
      return (data != null
              ? _ikeiwuzw.ReservationFutureCallExpireReservationModel.fromJson(
                  data,
                )
              : null)
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
    if (t == List<_i54fwjz6.Hospital>) {
      return (data as List)
              .map((e) => deserialize<_i54fwjz6.Hospital>(e))
              .toList()
          as T;
    }
    if (t == List<_igngxdck.AuditEvent>) {
      return (data as List)
              .map((e) => deserialize<_igngxdck.AuditEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_iu0v92hx.RescueCandidate>) {
      return (data as List)
              .map((e) => deserialize<_iu0v92hx.RescueCandidate>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
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
      _ikeiwuzw.ReservationFutureCallExpireReservationModel =>
        'ReservationFutureCallExpireReservationModel',
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
      case _ikeiwuzw.ReservationFutureCallExpireReservationModel():
        return 'ReservationFutureCallExpireReservationModel';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
    if (dataClassName == 'ReservationFutureCallExpireReservationModel') {
      return deserialize<_ikeiwuzw.ReservationFutureCallExpireReservationModel>(
        data['data'],
      );
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('batchbeacon', this);
    _iacs.Protocol().registerHostProtocol('batchbeacon', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _idmm8sdb.Approval:
        return _idmm8sdb.Approval.t;
      case _i6c4y87k.AuditEvent:
        return _i6c4y87k.AuditEvent.t;
      case _icim58h8.ConsumptionRecord:
        return _icim58h8.ConsumptionRecord.t;
      case _ip2t2lv0.Hospital:
        return _ip2t2lv0.Hospital.t;
      case _i5fzn4zj.HospitalPolicy:
        return _i5fzn4zj.HospitalPolicy.t;
      case _iertzni5.HospitalUser:
        return _iertzni5.HospitalUser.t;
      case _ig0ebxc6.InboundSupply:
        return _ig0ebxc6.InboundSupply.t;
      case _imfm9gtk.InventoryBatch:
        return _imfm9gtk.InventoryBatch.t;
      case _ivjabzzb.Medicine:
        return _ivjabzzb.Medicine.t;
      case _iislkj0w.Notification:
        return _iislkj0w.Notification.t;
      case _iiwkqagb.RescueProposal:
        return _iiwkqagb.RescueProposal.t;
      case _il2s7gfw.ShortageForecast:
        return _il2s7gfw.ShortageForecast.t;
      case _im5es8m7.StockReservation:
        return _im5es8m7.StockReservation.t;
      case _i7muwql4.TransferEvent:
        return _i7muwql4.TransferEvent.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

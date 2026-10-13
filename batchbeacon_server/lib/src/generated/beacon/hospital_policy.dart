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

abstract class HospitalPolicy
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      permittedShareCategories: _iti2zmxd.Protocol().deserialize<List<String>>(
        jsonSerialization['permittedShareCategories'],
      ),
      transferApprovalRequired: _is.BoolJsonExtension.fromJson(
        jsonSerialization['transferApprovalRequired'],
      ),
      transitDays: jsonSerialization['transitDays'] as int,
      forecastHorizonDays: jsonSerialization['forecastHorizonDays'] as int,
    );
  }

  static final t = HospitalPolicyTable();

  static const db = HospitalPolicyRepository._();

  @override
  int? id;

  int hospitalId;

  int safetyStockDays;

  int minimumRemainingShelfLifeDays;

  List<String> permittedShareCategories;

  bool transferApprovalRequired;

  int transitDays;

  int forecastHorizonDays;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [HospitalPolicy]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static HospitalPolicyInclude include() {
    return HospitalPolicyInclude._();
  }

  static HospitalPolicyIncludeList includeList({
    _is.WhereExpressionBuilder<HospitalPolicyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    HospitalPolicyInclude? include,
  }) {
    return HospitalPolicyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class HospitalPolicyUpdateTable extends _is.UpdateTable<HospitalPolicyTable> {
  HospitalPolicyUpdateTable(super.table);

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<int, int> safetyStockDays(int value) => _is.ColumnValue(
    table.safetyStockDays,
    value,
  );

  _is.ColumnValue<int, int> minimumRemainingShelfLifeDays(int value) =>
      _is.ColumnValue(
        table.minimumRemainingShelfLifeDays,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> permittedShareCategories(
    List<String> value,
  ) => _is.ColumnValue(
    table.permittedShareCategories,
    value,
  );

  _is.ColumnValue<bool, bool> transferApprovalRequired(bool value) =>
      _is.ColumnValue(
        table.transferApprovalRequired,
        value,
      );

  _is.ColumnValue<int, int> transitDays(int value) => _is.ColumnValue(
    table.transitDays,
    value,
  );

  _is.ColumnValue<int, int> forecastHorizonDays(int value) => _is.ColumnValue(
    table.forecastHorizonDays,
    value,
  );
}

class HospitalPolicyTable extends _is.Table<int?> {
  HospitalPolicyTable({super.tableRelation})
    : super(tableName: 'hospital_policies') {
    updateTable = HospitalPolicyUpdateTable(this);
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    safetyStockDays = _is.ColumnInt(
      'safetyStockDays',
      this,
    );
    minimumRemainingShelfLifeDays = _is.ColumnInt(
      'minimumRemainingShelfLifeDays',
      this,
    );
    permittedShareCategories = _is.ColumnSerializable<List<String>>(
      'permittedShareCategories',
      this,
    );
    transferApprovalRequired = _is.ColumnBool(
      'transferApprovalRequired',
      this,
    );
    transitDays = _is.ColumnInt(
      'transitDays',
      this,
    );
    forecastHorizonDays = _is.ColumnInt(
      'forecastHorizonDays',
      this,
    );
  }

  late final HospitalPolicyUpdateTable updateTable;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnInt safetyStockDays;

  late final _is.ColumnInt minimumRemainingShelfLifeDays;

  late final _is.ColumnSerializable<List<String>> permittedShareCategories;

  late final _is.ColumnBool transferApprovalRequired;

  late final _is.ColumnInt transitDays;

  late final _is.ColumnInt forecastHorizonDays;

  @override
  List<_is.Column> get columns => [
    id,
    hospitalId,
    safetyStockDays,
    minimumRemainingShelfLifeDays,
    permittedShareCategories,
    transferApprovalRequired,
    transitDays,
    forecastHorizonDays,
  ];
}

class HospitalPolicyInclude extends _is.IncludeObject {
  HospitalPolicyInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => HospitalPolicy.t;
}

class HospitalPolicyIncludeList extends _is.IncludeList {
  HospitalPolicyIncludeList._({
    _is.WhereExpressionBuilder<HospitalPolicyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HospitalPolicy.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => HospitalPolicy.t;
}

class HospitalPolicyRepository {
  const HospitalPolicyRepository._();

  /// Returns a list of [HospitalPolicy]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<HospitalPolicy>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalPolicyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<HospitalPolicy>(
      where: where?.call(HospitalPolicy.t),
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [HospitalPolicy] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<HospitalPolicy?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalPolicyTable>? where,
    int? offset,
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<HospitalPolicy>(
      where: where?.call(HospitalPolicy.t),
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [HospitalPolicy] by its [id] or null if no such row exists.
  Future<HospitalPolicy?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<HospitalPolicy>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [HospitalPolicy]s in the list and returns the inserted rows.
  ///
  /// The returned [HospitalPolicy]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> insert(
    _is.DatabaseSession session,
    List<HospitalPolicy> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<HospitalPolicy>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [HospitalPolicy] and returns the inserted row.
  ///
  /// The returned [HospitalPolicy] will have its `id` field set.
  Future<HospitalPolicy> insertRow(
    _is.DatabaseSession session,
    HospitalPolicy row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<HospitalPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [HospitalPolicy]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [HospitalPolicy]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> upsert(
    _is.DatabaseSession session,
    List<HospitalPolicy> rows, {
    required _is.ColumnSelections<HospitalPolicyTable> conflictColumns,
    _is.ColumnSelections<HospitalPolicyTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalPolicyTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<HospitalPolicy>(
      rows,
      conflictColumns: conflictColumns(HospitalPolicy.t),
      updateColumns: updateColumns?.call(HospitalPolicy.t),
      updateWhere: updateWhere?.call(HospitalPolicy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [HospitalPolicy] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [HospitalPolicy] will have its `id` field set.
  Future<HospitalPolicy?> upsertRow(
    _is.DatabaseSession session,
    HospitalPolicy row, {
    required _is.ColumnSelections<HospitalPolicyTable> conflictColumns,
    _is.ColumnSelections<HospitalPolicyTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalPolicyTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<HospitalPolicy>(
      row,
      conflictColumns: conflictColumns(HospitalPolicy.t),
      updateColumns: updateColumns?.call(HospitalPolicy.t),
      updateWhere: updateWhere?.call(HospitalPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates all [HospitalPolicy]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> update(
    _is.DatabaseSession session,
    List<HospitalPolicy> rows, {
    _is.ColumnSelections<HospitalPolicyTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<HospitalPolicy>(
      rows,
      columns: columns?.call(HospitalPolicy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [HospitalPolicy]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HospitalPolicy> updateRow(
    _is.DatabaseSession session,
    HospitalPolicy row, {
    _is.ColumnSelections<HospitalPolicyTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<HospitalPolicy>(
      row,
      columns: columns?.call(HospitalPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HospitalPolicy] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HospitalPolicy?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HospitalPolicyUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<HospitalPolicy>(
      id,
      columnValues: columnValues(HospitalPolicy.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HospitalPolicy]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HospitalPolicyUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<HospitalPolicyTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<HospitalPolicy>(
      columnValues: columnValues(HospitalPolicy.t.updateTable),
      where: where(HospitalPolicy.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [HospitalPolicy]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> delete(
    _is.DatabaseSession session,
    List<HospitalPolicy> rows, {
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<HospitalPolicy>(
      rows,
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [HospitalPolicy].
  Future<HospitalPolicy> deleteRow(
    _is.DatabaseSession session,
    HospitalPolicy row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HospitalPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalPolicy>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalPolicyTable> where,
    _is.OrderByBuilder<HospitalPolicyTable>? orderBy,
    _is.OrderByListBuilder<HospitalPolicyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<HospitalPolicy>(
      where: where(HospitalPolicy.t),
      orderBy: orderBy?.call(HospitalPolicy.t),
      orderByList: orderByList?.call(HospitalPolicy.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalPolicyTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<HospitalPolicy>(
      where: where?.call(HospitalPolicy.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [HospitalPolicy] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalPolicyTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<HospitalPolicy>(
      where: where(HospitalPolicy.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

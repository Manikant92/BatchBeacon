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

abstract class ConsumptionRecord
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ConsumptionRecord._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.date,
    required this.quantityUsed,
  });

  factory ConsumptionRecord({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime date,
    required int quantityUsed,
  }) = _ConsumptionRecordImpl;

  factory ConsumptionRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConsumptionRecord(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      date: _is.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      quantityUsed: jsonSerialization['quantityUsed'] as int,
    );
  }

  static final t = ConsumptionRecordTable();

  static const db = ConsumptionRecordRepository._();

  @override
  int? id;

  int hospitalId;

  int medicineId;

  DateTime date;

  int quantityUsed;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ConsumptionRecord]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ConsumptionRecord copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    DateTime? date,
    int? quantityUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ConsumptionRecord',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'date': date.toJson(),
      'quantityUsed': quantityUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ConsumptionRecord',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'date': date.toJson(),
      'quantityUsed': quantityUsed,
    };
  }

  static ConsumptionRecordInclude include() {
    return ConsumptionRecordInclude._();
  }

  static ConsumptionRecordIncludeList includeList({
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    ConsumptionRecordInclude? include,
  }) {
    return ConsumptionRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConsumptionRecordImpl extends ConsumptionRecord {
  _ConsumptionRecordImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime date,
    required int quantityUsed,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         date: date,
         quantityUsed: quantityUsed,
       );

  /// Returns a shallow copy of this [ConsumptionRecord]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ConsumptionRecord copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    DateTime? date,
    int? quantityUsed,
  }) {
    return ConsumptionRecord(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      date: date ?? this.date,
      quantityUsed: quantityUsed ?? this.quantityUsed,
    );
  }
}

class ConsumptionRecordUpdateTable
    extends _is.UpdateTable<ConsumptionRecordTable> {
  ConsumptionRecordUpdateTable(super.table);

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<int, int> medicineId(int value) => _is.ColumnValue(
    table.medicineId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> date(DateTime value) => _is.ColumnValue(
    table.date,
    value,
  );

  _is.ColumnValue<int, int> quantityUsed(int value) => _is.ColumnValue(
    table.quantityUsed,
    value,
  );
}

class ConsumptionRecordTable extends _is.Table<int?> {
  ConsumptionRecordTable({super.tableRelation})
    : super(tableName: 'consumption_records') {
    updateTable = ConsumptionRecordUpdateTable(this);
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    medicineId = _is.ColumnInt(
      'medicineId',
      this,
    );
    date = _is.ColumnDateTime(
      'date',
      this,
    );
    quantityUsed = _is.ColumnInt(
      'quantityUsed',
      this,
    );
  }

  late final ConsumptionRecordUpdateTable updateTable;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnInt medicineId;

  late final _is.ColumnDateTime date;

  late final _is.ColumnInt quantityUsed;

  @override
  List<_is.Column> get columns => [
    id,
    hospitalId,
    medicineId,
    date,
    quantityUsed,
  ];
}

class ConsumptionRecordInclude extends _is.IncludeObject {
  ConsumptionRecordInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ConsumptionRecord.t;
}

class ConsumptionRecordIncludeList extends _is.IncludeList {
  ConsumptionRecordIncludeList._({
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ConsumptionRecord.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ConsumptionRecord.t;
}

class ConsumptionRecordRepository {
  const ConsumptionRecordRepository._();

  /// Returns a list of [ConsumptionRecord]s matching the given query parameters.
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
  Future<List<ConsumptionRecord>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ConsumptionRecord>(
      where: where?.call(ConsumptionRecord.t),
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ConsumptionRecord] matching the given query parameters.
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
  Future<ConsumptionRecord?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? where,
    int? offset,
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ConsumptionRecord>(
      where: where?.call(ConsumptionRecord.t),
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ConsumptionRecord] by its [id] or null if no such row exists.
  Future<ConsumptionRecord?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ConsumptionRecord>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ConsumptionRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [ConsumptionRecord]s will have their `id` fields set.
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
  Future<List<ConsumptionRecord>> insert(
    _is.DatabaseSession session,
    List<ConsumptionRecord> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ConsumptionRecord>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ConsumptionRecord] and returns the inserted row.
  ///
  /// The returned [ConsumptionRecord] will have its `id` field set.
  Future<ConsumptionRecord> insertRow(
    _is.DatabaseSession session,
    ConsumptionRecord row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ConsumptionRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ConsumptionRecord]s in the list and returns the resulting rows.
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
  /// The returned [ConsumptionRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConsumptionRecord>> upsert(
    _is.DatabaseSession session,
    List<ConsumptionRecord> rows, {
    required _is.ColumnSelections<ConsumptionRecordTable> conflictColumns,
    _is.ColumnSelections<ConsumptionRecordTable>? updateColumns,
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ConsumptionRecord>(
      rows,
      conflictColumns: conflictColumns(ConsumptionRecord.t),
      updateColumns: updateColumns?.call(ConsumptionRecord.t),
      updateWhere: updateWhere?.call(ConsumptionRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ConsumptionRecord] and returns the resulting row.
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
  /// The returned [ConsumptionRecord] will have its `id` field set.
  Future<ConsumptionRecord?> upsertRow(
    _is.DatabaseSession session,
    ConsumptionRecord row, {
    required _is.ColumnSelections<ConsumptionRecordTable> conflictColumns,
    _is.ColumnSelections<ConsumptionRecordTable>? updateColumns,
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ConsumptionRecord>(
      row,
      conflictColumns: conflictColumns(ConsumptionRecord.t),
      updateColumns: updateColumns?.call(ConsumptionRecord.t),
      updateWhere: updateWhere?.call(ConsumptionRecord.t),
      transaction: transaction,
    );
  }

  /// Updates all [ConsumptionRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConsumptionRecord>> update(
    _is.DatabaseSession session,
    List<ConsumptionRecord> rows, {
    _is.ColumnSelections<ConsumptionRecordTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ConsumptionRecord>(
      rows,
      columns: columns?.call(ConsumptionRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ConsumptionRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ConsumptionRecord> updateRow(
    _is.DatabaseSession session,
    ConsumptionRecord row, {
    _is.ColumnSelections<ConsumptionRecordTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ConsumptionRecord>(
      row,
      columns: columns?.call(ConsumptionRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ConsumptionRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ConsumptionRecord?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ConsumptionRecordUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ConsumptionRecord>(
      id,
      columnValues: columnValues(ConsumptionRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ConsumptionRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ConsumptionRecord>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ConsumptionRecordUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<ConsumptionRecordTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ConsumptionRecord>(
      columnValues: columnValues(ConsumptionRecord.t.updateTable),
      where: where(ConsumptionRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ConsumptionRecord]s in the list and returns the deleted rows.
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
  Future<List<ConsumptionRecord>> delete(
    _is.DatabaseSession session,
    List<ConsumptionRecord> rows, {
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ConsumptionRecord>(
      rows,
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ConsumptionRecord].
  Future<ConsumptionRecord> deleteRow(
    _is.DatabaseSession session,
    ConsumptionRecord row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ConsumptionRecord>(
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
  Future<List<ConsumptionRecord>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConsumptionRecordTable> where,
    _is.OrderByBuilder<ConsumptionRecordTable>? orderBy,
    _is.OrderByListBuilder<ConsumptionRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ConsumptionRecord>(
      where: where(ConsumptionRecord.t),
      orderBy: orderBy?.call(ConsumptionRecord.t),
      orderByList: orderByList?.call(ConsumptionRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ConsumptionRecordTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ConsumptionRecord>(
      where: where?.call(ConsumptionRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ConsumptionRecord] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ConsumptionRecordTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ConsumptionRecord>(
      where: where(ConsumptionRecord.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

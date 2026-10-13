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

abstract class InventoryBatch
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  InventoryBatch._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.batchNumber,
    required this.quantityOnHand,
    required this.quantityReserved,
    required this.expiryDate,
    required this.storageStatus,
    required this.qualityStatus,
    required this.lastUpdatedAt,
    required this.version,
  });

  factory InventoryBatch({
    int? id,
    required int hospitalId,
    required int medicineId,
    required String batchNumber,
    required int quantityOnHand,
    required int quantityReserved,
    required DateTime expiryDate,
    required String storageStatus,
    required String qualityStatus,
    required DateTime lastUpdatedAt,
    required int version,
  }) = _InventoryBatchImpl;

  factory InventoryBatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return InventoryBatch(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      batchNumber: jsonSerialization['batchNumber'] as String,
      quantityOnHand: jsonSerialization['quantityOnHand'] as int,
      quantityReserved: jsonSerialization['quantityReserved'] as int,
      expiryDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiryDate'],
      ),
      storageStatus: jsonSerialization['storageStatus'] as String,
      qualityStatus: jsonSerialization['qualityStatus'] as String,
      lastUpdatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastUpdatedAt'],
      ),
      version: jsonSerialization['version'] as int,
    );
  }

  static final t = InventoryBatchTable();

  static const db = InventoryBatchRepository._();

  @override
  int? id;

  int hospitalId;

  int medicineId;

  String batchNumber;

  int quantityOnHand;

  int quantityReserved;

  DateTime expiryDate;

  String storageStatus;

  String qualityStatus;

  DateTime lastUpdatedAt;

  int version;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [InventoryBatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  InventoryBatch copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    String? batchNumber,
    int? quantityOnHand,
    int? quantityReserved,
    DateTime? expiryDate,
    String? storageStatus,
    String? qualityStatus,
    DateTime? lastUpdatedAt,
    int? version,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InventoryBatch',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'batchNumber': batchNumber,
      'quantityOnHand': quantityOnHand,
      'quantityReserved': quantityReserved,
      'expiryDate': expiryDate.toJson(),
      'storageStatus': storageStatus,
      'qualityStatus': qualityStatus,
      'lastUpdatedAt': lastUpdatedAt.toJson(),
      'version': version,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InventoryBatch',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'batchNumber': batchNumber,
      'quantityOnHand': quantityOnHand,
      'quantityReserved': quantityReserved,
      'expiryDate': expiryDate.toJson(),
      'storageStatus': storageStatus,
      'qualityStatus': qualityStatus,
      'lastUpdatedAt': lastUpdatedAt.toJson(),
      'version': version,
    };
  }

  static InventoryBatchInclude include() {
    return InventoryBatchInclude._();
  }

  static InventoryBatchIncludeList includeList({
    _is.WhereExpressionBuilder<InventoryBatchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    InventoryBatchInclude? include,
  }) {
    return InventoryBatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InventoryBatchImpl extends InventoryBatch {
  _InventoryBatchImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required String batchNumber,
    required int quantityOnHand,
    required int quantityReserved,
    required DateTime expiryDate,
    required String storageStatus,
    required String qualityStatus,
    required DateTime lastUpdatedAt,
    required int version,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         batchNumber: batchNumber,
         quantityOnHand: quantityOnHand,
         quantityReserved: quantityReserved,
         expiryDate: expiryDate,
         storageStatus: storageStatus,
         qualityStatus: qualityStatus,
         lastUpdatedAt: lastUpdatedAt,
         version: version,
       );

  /// Returns a shallow copy of this [InventoryBatch]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  InventoryBatch copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    String? batchNumber,
    int? quantityOnHand,
    int? quantityReserved,
    DateTime? expiryDate,
    String? storageStatus,
    String? qualityStatus,
    DateTime? lastUpdatedAt,
    int? version,
  }) {
    return InventoryBatch(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      batchNumber: batchNumber ?? this.batchNumber,
      quantityOnHand: quantityOnHand ?? this.quantityOnHand,
      quantityReserved: quantityReserved ?? this.quantityReserved,
      expiryDate: expiryDate ?? this.expiryDate,
      storageStatus: storageStatus ?? this.storageStatus,
      qualityStatus: qualityStatus ?? this.qualityStatus,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      version: version ?? this.version,
    );
  }
}

class InventoryBatchUpdateTable extends _is.UpdateTable<InventoryBatchTable> {
  InventoryBatchUpdateTable(super.table);

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<int, int> medicineId(int value) => _is.ColumnValue(
    table.medicineId,
    value,
  );

  _is.ColumnValue<String, String> batchNumber(String value) => _is.ColumnValue(
    table.batchNumber,
    value,
  );

  _is.ColumnValue<int, int> quantityOnHand(int value) => _is.ColumnValue(
    table.quantityOnHand,
    value,
  );

  _is.ColumnValue<int, int> quantityReserved(int value) => _is.ColumnValue(
    table.quantityReserved,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> expiryDate(DateTime value) =>
      _is.ColumnValue(
        table.expiryDate,
        value,
      );

  _is.ColumnValue<String, String> storageStatus(String value) =>
      _is.ColumnValue(
        table.storageStatus,
        value,
      );

  _is.ColumnValue<String, String> qualityStatus(String value) =>
      _is.ColumnValue(
        table.qualityStatus,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lastUpdatedAt(DateTime value) =>
      _is.ColumnValue(
        table.lastUpdatedAt,
        value,
      );

  _is.ColumnValue<int, int> version(int value) => _is.ColumnValue(
    table.version,
    value,
  );
}

class InventoryBatchTable extends _is.Table<int?> {
  InventoryBatchTable({super.tableRelation})
    : super(tableName: 'inventory_batches') {
    updateTable = InventoryBatchUpdateTable(this);
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    medicineId = _is.ColumnInt(
      'medicineId',
      this,
    );
    batchNumber = _is.ColumnString(
      'batchNumber',
      this,
    );
    quantityOnHand = _is.ColumnInt(
      'quantityOnHand',
      this,
    );
    quantityReserved = _is.ColumnInt(
      'quantityReserved',
      this,
    );
    expiryDate = _is.ColumnDateTime(
      'expiryDate',
      this,
    );
    storageStatus = _is.ColumnString(
      'storageStatus',
      this,
    );
    qualityStatus = _is.ColumnString(
      'qualityStatus',
      this,
    );
    lastUpdatedAt = _is.ColumnDateTime(
      'lastUpdatedAt',
      this,
    );
    version = _is.ColumnInt(
      'version',
      this,
    );
  }

  late final InventoryBatchUpdateTable updateTable;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnInt medicineId;

  late final _is.ColumnString batchNumber;

  late final _is.ColumnInt quantityOnHand;

  late final _is.ColumnInt quantityReserved;

  late final _is.ColumnDateTime expiryDate;

  late final _is.ColumnString storageStatus;

  late final _is.ColumnString qualityStatus;

  late final _is.ColumnDateTime lastUpdatedAt;

  late final _is.ColumnInt version;

  @override
  List<_is.Column> get columns => [
    id,
    hospitalId,
    medicineId,
    batchNumber,
    quantityOnHand,
    quantityReserved,
    expiryDate,
    storageStatus,
    qualityStatus,
    lastUpdatedAt,
    version,
  ];
}

class InventoryBatchInclude extends _is.IncludeObject {
  InventoryBatchInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => InventoryBatch.t;
}

class InventoryBatchIncludeList extends _is.IncludeList {
  InventoryBatchIncludeList._({
    _is.WhereExpressionBuilder<InventoryBatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InventoryBatch.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => InventoryBatch.t;
}

class InventoryBatchRepository {
  const InventoryBatchRepository._();

  /// Returns a list of [InventoryBatch]s matching the given query parameters.
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
  Future<List<InventoryBatch>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InventoryBatchTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<InventoryBatch>(
      where: where?.call(InventoryBatch.t),
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [InventoryBatch] matching the given query parameters.
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
  Future<InventoryBatch?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InventoryBatchTable>? where,
    int? offset,
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<InventoryBatch>(
      where: where?.call(InventoryBatch.t),
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [InventoryBatch] by its [id] or null if no such row exists.
  Future<InventoryBatch?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<InventoryBatch>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [InventoryBatch]s in the list and returns the inserted rows.
  ///
  /// The returned [InventoryBatch]s will have their `id` fields set.
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
  Future<List<InventoryBatch>> insert(
    _is.DatabaseSession session,
    List<InventoryBatch> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<InventoryBatch>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [InventoryBatch] and returns the inserted row.
  ///
  /// The returned [InventoryBatch] will have its `id` field set.
  Future<InventoryBatch> insertRow(
    _is.DatabaseSession session,
    InventoryBatch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<InventoryBatch>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [InventoryBatch]s in the list and returns the resulting rows.
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
  /// The returned [InventoryBatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InventoryBatch>> upsert(
    _is.DatabaseSession session,
    List<InventoryBatch> rows, {
    required _is.ColumnSelections<InventoryBatchTable> conflictColumns,
    _is.ColumnSelections<InventoryBatchTable>? updateColumns,
    _is.WhereExpressionBuilder<InventoryBatchTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<InventoryBatch>(
      rows,
      conflictColumns: conflictColumns(InventoryBatch.t),
      updateColumns: updateColumns?.call(InventoryBatch.t),
      updateWhere: updateWhere?.call(InventoryBatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [InventoryBatch] and returns the resulting row.
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
  /// The returned [InventoryBatch] will have its `id` field set.
  Future<InventoryBatch?> upsertRow(
    _is.DatabaseSession session,
    InventoryBatch row, {
    required _is.ColumnSelections<InventoryBatchTable> conflictColumns,
    _is.ColumnSelections<InventoryBatchTable>? updateColumns,
    _is.WhereExpressionBuilder<InventoryBatchTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<InventoryBatch>(
      row,
      conflictColumns: conflictColumns(InventoryBatch.t),
      updateColumns: updateColumns?.call(InventoryBatch.t),
      updateWhere: updateWhere?.call(InventoryBatch.t),
      transaction: transaction,
    );
  }

  /// Updates all [InventoryBatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InventoryBatch>> update(
    _is.DatabaseSession session,
    List<InventoryBatch> rows, {
    _is.ColumnSelections<InventoryBatchTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<InventoryBatch>(
      rows,
      columns: columns?.call(InventoryBatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [InventoryBatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<InventoryBatch> updateRow(
    _is.DatabaseSession session,
    InventoryBatch row, {
    _is.ColumnSelections<InventoryBatchTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<InventoryBatch>(
      row,
      columns: columns?.call(InventoryBatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InventoryBatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<InventoryBatch?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<InventoryBatchUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<InventoryBatch>(
      id,
      columnValues: columnValues(InventoryBatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [InventoryBatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InventoryBatch>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<InventoryBatchUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<InventoryBatchTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<InventoryBatch>(
      columnValues: columnValues(InventoryBatch.t.updateTable),
      where: where(InventoryBatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [InventoryBatch]s in the list and returns the deleted rows.
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
  Future<List<InventoryBatch>> delete(
    _is.DatabaseSession session,
    List<InventoryBatch> rows, {
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<InventoryBatch>(
      rows,
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [InventoryBatch].
  Future<InventoryBatch> deleteRow(
    _is.DatabaseSession session,
    InventoryBatch row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InventoryBatch>(
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
  Future<List<InventoryBatch>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<InventoryBatchTable> where,
    _is.OrderByBuilder<InventoryBatchTable>? orderBy,
    _is.OrderByListBuilder<InventoryBatchTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<InventoryBatch>(
      where: where(InventoryBatch.t),
      orderBy: orderBy?.call(InventoryBatch.t),
      orderByList: orderByList?.call(InventoryBatch.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InventoryBatchTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<InventoryBatch>(
      where: where?.call(InventoryBatch.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [InventoryBatch] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<InventoryBatchTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<InventoryBatch>(
      where: where(InventoryBatch.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

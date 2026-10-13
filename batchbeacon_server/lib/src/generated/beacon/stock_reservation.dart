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

abstract class StockReservation
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  StockReservation._({
    this.id,
    required this.proposalId,
    required this.inventoryBatchId,
    required this.quantity,
    required this.status,
    required this.expiresAt,
  });

  factory StockReservation({
    int? id,
    required int proposalId,
    required int inventoryBatchId,
    required int quantity,
    required String status,
    required DateTime expiresAt,
  }) = _StockReservationImpl;

  factory StockReservation.fromJson(Map<String, dynamic> jsonSerialization) {
    return StockReservation(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      inventoryBatchId: jsonSerialization['inventoryBatchId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      status: jsonSerialization['status'] as String,
      expiresAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
    );
  }

  static final t = StockReservationTable();

  static const db = StockReservationRepository._();

  @override
  int? id;

  int proposalId;

  int inventoryBatchId;

  int quantity;

  String status;

  DateTime expiresAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [StockReservation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  StockReservation copyWith({
    int? id,
    int? proposalId,
    int? inventoryBatchId,
    int? quantity,
    String? status,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StockReservation',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'inventoryBatchId': inventoryBatchId,
      'quantity': quantity,
      'status': status,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StockReservation',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'inventoryBatchId': inventoryBatchId,
      'quantity': quantity,
      'status': status,
      'expiresAt': expiresAt.toJson(),
    };
  }

  static StockReservationInclude include() {
    return StockReservationInclude._();
  }

  static StockReservationIncludeList includeList({
    _is.WhereExpressionBuilder<StockReservationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    StockReservationInclude? include,
  }) {
    return StockReservationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StockReservationImpl extends StockReservation {
  _StockReservationImpl({
    int? id,
    required int proposalId,
    required int inventoryBatchId,
    required int quantity,
    required String status,
    required DateTime expiresAt,
  }) : super._(
         id: id,
         proposalId: proposalId,
         inventoryBatchId: inventoryBatchId,
         quantity: quantity,
         status: status,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [StockReservation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  StockReservation copyWith({
    Object? id = _Undefined,
    int? proposalId,
    int? inventoryBatchId,
    int? quantity,
    String? status,
    DateTime? expiresAt,
  }) {
    return StockReservation(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      inventoryBatchId: inventoryBatchId ?? this.inventoryBatchId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

class StockReservationUpdateTable
    extends _is.UpdateTable<StockReservationTable> {
  StockReservationUpdateTable(super.table);

  _is.ColumnValue<int, int> proposalId(int value) => _is.ColumnValue(
    table.proposalId,
    value,
  );

  _is.ColumnValue<int, int> inventoryBatchId(int value) => _is.ColumnValue(
    table.inventoryBatchId,
    value,
  );

  _is.ColumnValue<int, int> quantity(int value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _is.ColumnValue(
        table.expiresAt,
        value,
      );
}

class StockReservationTable extends _is.Table<int?> {
  StockReservationTable({super.tableRelation})
    : super(tableName: 'stock_reservations') {
    updateTable = StockReservationUpdateTable(this);
    proposalId = _is.ColumnInt(
      'proposalId',
      this,
    );
    inventoryBatchId = _is.ColumnInt(
      'inventoryBatchId',
      this,
    );
    quantity = _is.ColumnInt(
      'quantity',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    expiresAt = _is.ColumnDateTime(
      'expiresAt',
      this,
    );
  }

  late final StockReservationUpdateTable updateTable;

  late final _is.ColumnInt proposalId;

  late final _is.ColumnInt inventoryBatchId;

  late final _is.ColumnInt quantity;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime expiresAt;

  @override
  List<_is.Column> get columns => [
    id,
    proposalId,
    inventoryBatchId,
    quantity,
    status,
    expiresAt,
  ];
}

class StockReservationInclude extends _is.IncludeObject {
  StockReservationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => StockReservation.t;
}

class StockReservationIncludeList extends _is.IncludeList {
  StockReservationIncludeList._({
    _is.WhereExpressionBuilder<StockReservationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StockReservation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => StockReservation.t;
}

class StockReservationRepository {
  const StockReservationRepository._();

  /// Returns a list of [StockReservation]s matching the given query parameters.
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
  Future<List<StockReservation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StockReservationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StockReservation>(
      where: where?.call(StockReservation.t),
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StockReservation] matching the given query parameters.
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
  Future<StockReservation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StockReservationTable>? where,
    int? offset,
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StockReservation>(
      where: where?.call(StockReservation.t),
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StockReservation] by its [id] or null if no such row exists.
  Future<StockReservation?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StockReservation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StockReservation]s in the list and returns the inserted rows.
  ///
  /// The returned [StockReservation]s will have their `id` fields set.
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
  Future<List<StockReservation>> insert(
    _is.DatabaseSession session,
    List<StockReservation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<StockReservation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [StockReservation] and returns the inserted row.
  ///
  /// The returned [StockReservation] will have its `id` field set.
  Future<StockReservation> insertRow(
    _is.DatabaseSession session,
    StockReservation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<StockReservation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [StockReservation]s in the list and returns the resulting rows.
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
  /// The returned [StockReservation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StockReservation>> upsert(
    _is.DatabaseSession session,
    List<StockReservation> rows, {
    required _is.ColumnSelections<StockReservationTable> conflictColumns,
    _is.ColumnSelections<StockReservationTable>? updateColumns,
    _is.WhereExpressionBuilder<StockReservationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<StockReservation>(
      rows,
      conflictColumns: conflictColumns(StockReservation.t),
      updateColumns: updateColumns?.call(StockReservation.t),
      updateWhere: updateWhere?.call(StockReservation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [StockReservation] and returns the resulting row.
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
  /// The returned [StockReservation] will have its `id` field set.
  Future<StockReservation?> upsertRow(
    _is.DatabaseSession session,
    StockReservation row, {
    required _is.ColumnSelections<StockReservationTable> conflictColumns,
    _is.ColumnSelections<StockReservationTable>? updateColumns,
    _is.WhereExpressionBuilder<StockReservationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<StockReservation>(
      row,
      conflictColumns: conflictColumns(StockReservation.t),
      updateColumns: updateColumns?.call(StockReservation.t),
      updateWhere: updateWhere?.call(StockReservation.t),
      transaction: transaction,
    );
  }

  /// Updates all [StockReservation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StockReservation>> update(
    _is.DatabaseSession session,
    List<StockReservation> rows, {
    _is.ColumnSelections<StockReservationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<StockReservation>(
      rows,
      columns: columns?.call(StockReservation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [StockReservation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StockReservation> updateRow(
    _is.DatabaseSession session,
    StockReservation row, {
    _is.ColumnSelections<StockReservationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<StockReservation>(
      row,
      columns: columns?.call(StockReservation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StockReservation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StockReservation?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<StockReservationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<StockReservation>(
      id,
      columnValues: columnValues(StockReservation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StockReservation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StockReservation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StockReservationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<StockReservationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<StockReservation>(
      columnValues: columnValues(StockReservation.t.updateTable),
      where: where(StockReservation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [StockReservation]s in the list and returns the deleted rows.
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
  Future<List<StockReservation>> delete(
    _is.DatabaseSession session,
    List<StockReservation> rows, {
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<StockReservation>(
      rows,
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [StockReservation].
  Future<StockReservation> deleteRow(
    _is.DatabaseSession session,
    StockReservation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StockReservation>(
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
  Future<List<StockReservation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StockReservationTable> where,
    _is.OrderByBuilder<StockReservationTable>? orderBy,
    _is.OrderByListBuilder<StockReservationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<StockReservation>(
      where: where(StockReservation.t),
      orderBy: orderBy?.call(StockReservation.t),
      orderByList: orderByList?.call(StockReservation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StockReservationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<StockReservation>(
      where: where?.call(StockReservation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StockReservation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StockReservationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StockReservation>(
      where: where(StockReservation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

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

abstract class InboundSupply
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  InboundSupply._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.quantity,
    required this.expectedArrivalDate,
    required this.confirmationStatus,
  });

  factory InboundSupply({
    int? id,
    required int hospitalId,
    required int medicineId,
    required int quantity,
    required DateTime expectedArrivalDate,
    required String confirmationStatus,
  }) = _InboundSupplyImpl;

  factory InboundSupply.fromJson(Map<String, dynamic> jsonSerialization) {
    return InboundSupply(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      expectedArrivalDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expectedArrivalDate'],
      ),
      confirmationStatus: jsonSerialization['confirmationStatus'] as String,
    );
  }

  static final t = InboundSupplyTable();

  static const db = InboundSupplyRepository._();

  @override
  int? id;

  int hospitalId;

  int medicineId;

  int quantity;

  DateTime expectedArrivalDate;

  String confirmationStatus;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [InboundSupply]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  InboundSupply copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    int? quantity,
    DateTime? expectedArrivalDate,
    String? confirmationStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InboundSupply',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'quantity': quantity,
      'expectedArrivalDate': expectedArrivalDate.toJson(),
      'confirmationStatus': confirmationStatus,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InboundSupply',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'quantity': quantity,
      'expectedArrivalDate': expectedArrivalDate.toJson(),
      'confirmationStatus': confirmationStatus,
    };
  }

  static InboundSupplyInclude include() {
    return InboundSupplyInclude._();
  }

  static InboundSupplyIncludeList includeList({
    _is.WhereExpressionBuilder<InboundSupplyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    InboundSupplyInclude? include,
  }) {
    return InboundSupplyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InboundSupplyImpl extends InboundSupply {
  _InboundSupplyImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required int quantity,
    required DateTime expectedArrivalDate,
    required String confirmationStatus,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         quantity: quantity,
         expectedArrivalDate: expectedArrivalDate,
         confirmationStatus: confirmationStatus,
       );

  /// Returns a shallow copy of this [InboundSupply]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  InboundSupply copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    int? quantity,
    DateTime? expectedArrivalDate,
    String? confirmationStatus,
  }) {
    return InboundSupply(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      quantity: quantity ?? this.quantity,
      expectedArrivalDate: expectedArrivalDate ?? this.expectedArrivalDate,
      confirmationStatus: confirmationStatus ?? this.confirmationStatus,
    );
  }
}

class InboundSupplyUpdateTable extends _is.UpdateTable<InboundSupplyTable> {
  InboundSupplyUpdateTable(super.table);

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<int, int> medicineId(int value) => _is.ColumnValue(
    table.medicineId,
    value,
  );

  _is.ColumnValue<int, int> quantity(int value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> expectedArrivalDate(DateTime value) =>
      _is.ColumnValue(
        table.expectedArrivalDate,
        value,
      );

  _is.ColumnValue<String, String> confirmationStatus(String value) =>
      _is.ColumnValue(
        table.confirmationStatus,
        value,
      );
}

class InboundSupplyTable extends _is.Table<int?> {
  InboundSupplyTable({super.tableRelation})
    : super(tableName: 'inbound_supplies') {
    updateTable = InboundSupplyUpdateTable(this);
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    medicineId = _is.ColumnInt(
      'medicineId',
      this,
    );
    quantity = _is.ColumnInt(
      'quantity',
      this,
    );
    expectedArrivalDate = _is.ColumnDateTime(
      'expectedArrivalDate',
      this,
    );
    confirmationStatus = _is.ColumnString(
      'confirmationStatus',
      this,
    );
  }

  late final InboundSupplyUpdateTable updateTable;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnInt medicineId;

  late final _is.ColumnInt quantity;

  late final _is.ColumnDateTime expectedArrivalDate;

  late final _is.ColumnString confirmationStatus;

  @override
  List<_is.Column> get columns => [
    id,
    hospitalId,
    medicineId,
    quantity,
    expectedArrivalDate,
    confirmationStatus,
  ];
}

class InboundSupplyInclude extends _is.IncludeObject {
  InboundSupplyInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => InboundSupply.t;
}

class InboundSupplyIncludeList extends _is.IncludeList {
  InboundSupplyIncludeList._({
    _is.WhereExpressionBuilder<InboundSupplyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InboundSupply.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => InboundSupply.t;
}

class InboundSupplyRepository {
  const InboundSupplyRepository._();

  /// Returns a list of [InboundSupply]s matching the given query parameters.
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
  Future<List<InboundSupply>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InboundSupplyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<InboundSupply>(
      where: where?.call(InboundSupply.t),
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [InboundSupply] matching the given query parameters.
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
  Future<InboundSupply?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InboundSupplyTable>? where,
    int? offset,
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<InboundSupply>(
      where: where?.call(InboundSupply.t),
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [InboundSupply] by its [id] or null if no such row exists.
  Future<InboundSupply?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<InboundSupply>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [InboundSupply]s in the list and returns the inserted rows.
  ///
  /// The returned [InboundSupply]s will have their `id` fields set.
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
  Future<List<InboundSupply>> insert(
    _is.DatabaseSession session,
    List<InboundSupply> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<InboundSupply>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [InboundSupply] and returns the inserted row.
  ///
  /// The returned [InboundSupply] will have its `id` field set.
  Future<InboundSupply> insertRow(
    _is.DatabaseSession session,
    InboundSupply row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<InboundSupply>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [InboundSupply]s in the list and returns the resulting rows.
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
  /// The returned [InboundSupply]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InboundSupply>> upsert(
    _is.DatabaseSession session,
    List<InboundSupply> rows, {
    required _is.ColumnSelections<InboundSupplyTable> conflictColumns,
    _is.ColumnSelections<InboundSupplyTable>? updateColumns,
    _is.WhereExpressionBuilder<InboundSupplyTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<InboundSupply>(
      rows,
      conflictColumns: conflictColumns(InboundSupply.t),
      updateColumns: updateColumns?.call(InboundSupply.t),
      updateWhere: updateWhere?.call(InboundSupply.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [InboundSupply] and returns the resulting row.
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
  /// The returned [InboundSupply] will have its `id` field set.
  Future<InboundSupply?> upsertRow(
    _is.DatabaseSession session,
    InboundSupply row, {
    required _is.ColumnSelections<InboundSupplyTable> conflictColumns,
    _is.ColumnSelections<InboundSupplyTable>? updateColumns,
    _is.WhereExpressionBuilder<InboundSupplyTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<InboundSupply>(
      row,
      conflictColumns: conflictColumns(InboundSupply.t),
      updateColumns: updateColumns?.call(InboundSupply.t),
      updateWhere: updateWhere?.call(InboundSupply.t),
      transaction: transaction,
    );
  }

  /// Updates all [InboundSupply]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InboundSupply>> update(
    _is.DatabaseSession session,
    List<InboundSupply> rows, {
    _is.ColumnSelections<InboundSupplyTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<InboundSupply>(
      rows,
      columns: columns?.call(InboundSupply.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [InboundSupply]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<InboundSupply> updateRow(
    _is.DatabaseSession session,
    InboundSupply row, {
    _is.ColumnSelections<InboundSupplyTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<InboundSupply>(
      row,
      columns: columns?.call(InboundSupply.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InboundSupply] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<InboundSupply?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<InboundSupplyUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<InboundSupply>(
      id,
      columnValues: columnValues(InboundSupply.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [InboundSupply]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<InboundSupply>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<InboundSupplyUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<InboundSupplyTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<InboundSupply>(
      columnValues: columnValues(InboundSupply.t.updateTable),
      where: where(InboundSupply.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [InboundSupply]s in the list and returns the deleted rows.
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
  Future<List<InboundSupply>> delete(
    _is.DatabaseSession session,
    List<InboundSupply> rows, {
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<InboundSupply>(
      rows,
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [InboundSupply].
  Future<InboundSupply> deleteRow(
    _is.DatabaseSession session,
    InboundSupply row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InboundSupply>(
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
  Future<List<InboundSupply>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<InboundSupplyTable> where,
    _is.OrderByBuilder<InboundSupplyTable>? orderBy,
    _is.OrderByListBuilder<InboundSupplyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<InboundSupply>(
      where: where(InboundSupply.t),
      orderBy: orderBy?.call(InboundSupply.t),
      orderByList: orderByList?.call(InboundSupply.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<InboundSupplyTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<InboundSupply>(
      where: where?.call(InboundSupply.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [InboundSupply] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<InboundSupplyTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<InboundSupply>(
      where: where(InboundSupply.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

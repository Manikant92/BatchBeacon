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

abstract class TransferEvent
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  TransferEvent._({
    this.id,
    required this.proposalId,
    required this.eventType,
    required this.actorId,
    required this.timestamp,
    required this.metadata,
  });

  factory TransferEvent({
    int? id,
    required int proposalId,
    required String eventType,
    required _is.UuidValue actorId,
    required DateTime timestamp,
    required String metadata,
  }) = _TransferEventImpl;

  factory TransferEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TransferEvent(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      eventType: jsonSerialization['eventType'] as String,
      actorId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['actorId'],
      ),
      timestamp: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      metadata: jsonSerialization['metadata'] as String,
    );
  }

  static final t = TransferEventTable();

  static const db = TransferEventRepository._();

  @override
  int? id;

  int proposalId;

  String eventType;

  _is.UuidValue actorId;

  DateTime timestamp;

  String metadata;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [TransferEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TransferEvent copyWith({
    int? id,
    int? proposalId,
    String? eventType,
    _is.UuidValue? actorId,
    DateTime? timestamp,
    String? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransferEvent',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'eventType': eventType,
      'actorId': actorId.toJson(),
      'timestamp': timestamp.toJson(),
      'metadata': metadata,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TransferEvent',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'eventType': eventType,
      'actorId': actorId.toJson(),
      'timestamp': timestamp.toJson(),
      'metadata': metadata,
    };
  }

  static TransferEventInclude include() {
    return TransferEventInclude._();
  }

  static TransferEventIncludeList includeList({
    _is.WhereExpressionBuilder<TransferEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    TransferEventInclude? include,
  }) {
    return TransferEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransferEventImpl extends TransferEvent {
  _TransferEventImpl({
    int? id,
    required int proposalId,
    required String eventType,
    required _is.UuidValue actorId,
    required DateTime timestamp,
    required String metadata,
  }) : super._(
         id: id,
         proposalId: proposalId,
         eventType: eventType,
         actorId: actorId,
         timestamp: timestamp,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [TransferEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TransferEvent copyWith({
    Object? id = _Undefined,
    int? proposalId,
    String? eventType,
    _is.UuidValue? actorId,
    DateTime? timestamp,
    String? metadata,
  }) {
    return TransferEvent(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      eventType: eventType ?? this.eventType,
      actorId: actorId ?? this.actorId,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
    );
  }
}

class TransferEventUpdateTable extends _is.UpdateTable<TransferEventTable> {
  TransferEventUpdateTable(super.table);

  _is.ColumnValue<int, int> proposalId(int value) => _is.ColumnValue(
    table.proposalId,
    value,
  );

  _is.ColumnValue<String, String> eventType(String value) => _is.ColumnValue(
    table.eventType,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> actorId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.actorId,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _is.ColumnValue(
        table.timestamp,
        value,
      );

  _is.ColumnValue<String, String> metadata(String value) => _is.ColumnValue(
    table.metadata,
    value,
  );
}

class TransferEventTable extends _is.Table<int?> {
  TransferEventTable({super.tableRelation})
    : super(tableName: 'transfer_events') {
    updateTable = TransferEventUpdateTable(this);
    proposalId = _is.ColumnInt(
      'proposalId',
      this,
    );
    eventType = _is.ColumnString(
      'eventType',
      this,
    );
    actorId = _is.ColumnUuid(
      'actorId',
      this,
    );
    timestamp = _is.ColumnDateTime(
      'timestamp',
      this,
    );
    metadata = _is.ColumnString(
      'metadata',
      this,
    );
  }

  late final TransferEventUpdateTable updateTable;

  late final _is.ColumnInt proposalId;

  late final _is.ColumnString eventType;

  late final _is.ColumnUuid actorId;

  late final _is.ColumnDateTime timestamp;

  late final _is.ColumnString metadata;

  @override
  List<_is.Column> get columns => [
    id,
    proposalId,
    eventType,
    actorId,
    timestamp,
    metadata,
  ];
}

class TransferEventInclude extends _is.IncludeObject {
  TransferEventInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => TransferEvent.t;
}

class TransferEventIncludeList extends _is.IncludeList {
  TransferEventIncludeList._({
    _is.WhereExpressionBuilder<TransferEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TransferEvent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => TransferEvent.t;
}

class TransferEventRepository {
  const TransferEventRepository._();

  /// Returns a list of [TransferEvent]s matching the given query parameters.
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
  Future<List<TransferEvent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransferEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TransferEvent>(
      where: where?.call(TransferEvent.t),
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TransferEvent] matching the given query parameters.
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
  Future<TransferEvent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransferEventTable>? where,
    int? offset,
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TransferEvent>(
      where: where?.call(TransferEvent.t),
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TransferEvent] by its [id] or null if no such row exists.
  Future<TransferEvent?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TransferEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TransferEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [TransferEvent]s will have their `id` fields set.
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
  Future<List<TransferEvent>> insert(
    _is.DatabaseSession session,
    List<TransferEvent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TransferEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TransferEvent] and returns the inserted row.
  ///
  /// The returned [TransferEvent] will have its `id` field set.
  Future<TransferEvent> insertRow(
    _is.DatabaseSession session,
    TransferEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TransferEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TransferEvent]s in the list and returns the resulting rows.
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
  /// The returned [TransferEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransferEvent>> upsert(
    _is.DatabaseSession session,
    List<TransferEvent> rows, {
    required _is.ColumnSelections<TransferEventTable> conflictColumns,
    _is.ColumnSelections<TransferEventTable>? updateColumns,
    _is.WhereExpressionBuilder<TransferEventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TransferEvent>(
      rows,
      conflictColumns: conflictColumns(TransferEvent.t),
      updateColumns: updateColumns?.call(TransferEvent.t),
      updateWhere: updateWhere?.call(TransferEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TransferEvent] and returns the resulting row.
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
  /// The returned [TransferEvent] will have its `id` field set.
  Future<TransferEvent?> upsertRow(
    _is.DatabaseSession session,
    TransferEvent row, {
    required _is.ColumnSelections<TransferEventTable> conflictColumns,
    _is.ColumnSelections<TransferEventTable>? updateColumns,
    _is.WhereExpressionBuilder<TransferEventTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TransferEvent>(
      row,
      conflictColumns: conflictColumns(TransferEvent.t),
      updateColumns: updateColumns?.call(TransferEvent.t),
      updateWhere: updateWhere?.call(TransferEvent.t),
      transaction: transaction,
    );
  }

  /// Updates all [TransferEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransferEvent>> update(
    _is.DatabaseSession session,
    List<TransferEvent> rows, {
    _is.ColumnSelections<TransferEventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TransferEvent>(
      rows,
      columns: columns?.call(TransferEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TransferEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TransferEvent> updateRow(
    _is.DatabaseSession session,
    TransferEvent row, {
    _is.ColumnSelections<TransferEventTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TransferEvent>(
      row,
      columns: columns?.call(TransferEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TransferEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TransferEvent?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<TransferEventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TransferEvent>(
      id,
      columnValues: columnValues(TransferEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TransferEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TransferEvent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TransferEventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<TransferEventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TransferEvent>(
      columnValues: columnValues(TransferEvent.t.updateTable),
      where: where(TransferEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TransferEvent]s in the list and returns the deleted rows.
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
  Future<List<TransferEvent>> delete(
    _is.DatabaseSession session,
    List<TransferEvent> rows, {
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TransferEvent>(
      rows,
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TransferEvent].
  Future<TransferEvent> deleteRow(
    _is.DatabaseSession session,
    TransferEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TransferEvent>(
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
  Future<List<TransferEvent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransferEventTable> where,
    _is.OrderByBuilder<TransferEventTable>? orderBy,
    _is.OrderByListBuilder<TransferEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TransferEvent>(
      where: where(TransferEvent.t),
      orderBy: orderBy?.call(TransferEvent.t),
      orderByList: orderByList?.call(TransferEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TransferEventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TransferEvent>(
      where: where?.call(TransferEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TransferEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TransferEventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TransferEvent>(
      where: where(TransferEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

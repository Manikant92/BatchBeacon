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

abstract class Approval
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Approval._({
    this.id,
    required this.proposalId,
    required this.hospitalId,
    required this.reviewerId,
    required this.decision,
    required this.timestamp,
    required this.note,
  });

  factory Approval({
    int? id,
    required int proposalId,
    required int hospitalId,
    required _is.UuidValue reviewerId,
    required String decision,
    required DateTime timestamp,
    required String note,
  }) = _ApprovalImpl;

  factory Approval.fromJson(Map<String, dynamic> jsonSerialization) {
    return Approval(
      id: jsonSerialization['id'] as int?,
      proposalId: jsonSerialization['proposalId'] as int,
      hospitalId: jsonSerialization['hospitalId'] as int,
      reviewerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['reviewerId'],
      ),
      decision: jsonSerialization['decision'] as String,
      timestamp: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      note: jsonSerialization['note'] as String,
    );
  }

  static final t = ApprovalTable();

  static const db = ApprovalRepository._();

  @override
  int? id;

  int proposalId;

  int hospitalId;

  _is.UuidValue reviewerId;

  String decision;

  DateTime timestamp;

  String note;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Approval]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Approval copyWith({
    int? id,
    int? proposalId,
    int? hospitalId,
    _is.UuidValue? reviewerId,
    String? decision,
    DateTime? timestamp,
    String? note,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Approval',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'hospitalId': hospitalId,
      'reviewerId': reviewerId.toJson(),
      'decision': decision,
      'timestamp': timestamp.toJson(),
      'note': note,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Approval',
      if (id != null) 'id': id,
      'proposalId': proposalId,
      'hospitalId': hospitalId,
      'reviewerId': reviewerId.toJson(),
      'decision': decision,
      'timestamp': timestamp.toJson(),
      'note': note,
    };
  }

  static ApprovalInclude include() {
    return ApprovalInclude._();
  }

  static ApprovalIncludeList includeList({
    _is.WhereExpressionBuilder<ApprovalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    ApprovalInclude? include,
  }) {
    return ApprovalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApprovalImpl extends Approval {
  _ApprovalImpl({
    int? id,
    required int proposalId,
    required int hospitalId,
    required _is.UuidValue reviewerId,
    required String decision,
    required DateTime timestamp,
    required String note,
  }) : super._(
         id: id,
         proposalId: proposalId,
         hospitalId: hospitalId,
         reviewerId: reviewerId,
         decision: decision,
         timestamp: timestamp,
         note: note,
       );

  /// Returns a shallow copy of this [Approval]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Approval copyWith({
    Object? id = _Undefined,
    int? proposalId,
    int? hospitalId,
    _is.UuidValue? reviewerId,
    String? decision,
    DateTime? timestamp,
    String? note,
  }) {
    return Approval(
      id: id is int? ? id : this.id,
      proposalId: proposalId ?? this.proposalId,
      hospitalId: hospitalId ?? this.hospitalId,
      reviewerId: reviewerId ?? this.reviewerId,
      decision: decision ?? this.decision,
      timestamp: timestamp ?? this.timestamp,
      note: note ?? this.note,
    );
  }
}

class ApprovalUpdateTable extends _is.UpdateTable<ApprovalTable> {
  ApprovalUpdateTable(super.table);

  _is.ColumnValue<int, int> proposalId(int value) => _is.ColumnValue(
    table.proposalId,
    value,
  );

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> reviewerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.reviewerId,
    value,
  );

  _is.ColumnValue<String, String> decision(String value) => _is.ColumnValue(
    table.decision,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _is.ColumnValue(
        table.timestamp,
        value,
      );

  _is.ColumnValue<String, String> note(String value) => _is.ColumnValue(
    table.note,
    value,
  );
}

class ApprovalTable extends _is.Table<int?> {
  ApprovalTable({super.tableRelation}) : super(tableName: 'approvals') {
    updateTable = ApprovalUpdateTable(this);
    proposalId = _is.ColumnInt(
      'proposalId',
      this,
    );
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    reviewerId = _is.ColumnUuid(
      'reviewerId',
      this,
    );
    decision = _is.ColumnString(
      'decision',
      this,
    );
    timestamp = _is.ColumnDateTime(
      'timestamp',
      this,
    );
    note = _is.ColumnString(
      'note',
      this,
    );
  }

  late final ApprovalUpdateTable updateTable;

  late final _is.ColumnInt proposalId;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnUuid reviewerId;

  late final _is.ColumnString decision;

  late final _is.ColumnDateTime timestamp;

  late final _is.ColumnString note;

  @override
  List<_is.Column> get columns => [
    id,
    proposalId,
    hospitalId,
    reviewerId,
    decision,
    timestamp,
    note,
  ];
}

class ApprovalInclude extends _is.IncludeObject {
  ApprovalInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Approval.t;
}

class ApprovalIncludeList extends _is.IncludeList {
  ApprovalIncludeList._({
    _is.WhereExpressionBuilder<ApprovalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Approval.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Approval.t;
}

class ApprovalRepository {
  const ApprovalRepository._();

  /// Returns a list of [Approval]s matching the given query parameters.
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
  Future<List<Approval>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ApprovalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Approval>(
      where: where?.call(Approval.t),
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Approval] matching the given query parameters.
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
  Future<Approval?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ApprovalTable>? where,
    int? offset,
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Approval>(
      where: where?.call(Approval.t),
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Approval] by its [id] or null if no such row exists.
  Future<Approval?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Approval>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Approval]s in the list and returns the inserted rows.
  ///
  /// The returned [Approval]s will have their `id` fields set.
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
  Future<List<Approval>> insert(
    _is.DatabaseSession session,
    List<Approval> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Approval>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Approval] and returns the inserted row.
  ///
  /// The returned [Approval] will have its `id` field set.
  Future<Approval> insertRow(
    _is.DatabaseSession session,
    Approval row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Approval>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Approval]s in the list and returns the resulting rows.
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
  /// The returned [Approval]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Approval>> upsert(
    _is.DatabaseSession session,
    List<Approval> rows, {
    required _is.ColumnSelections<ApprovalTable> conflictColumns,
    _is.ColumnSelections<ApprovalTable>? updateColumns,
    _is.WhereExpressionBuilder<ApprovalTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Approval>(
      rows,
      conflictColumns: conflictColumns(Approval.t),
      updateColumns: updateColumns?.call(Approval.t),
      updateWhere: updateWhere?.call(Approval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Approval] and returns the resulting row.
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
  /// The returned [Approval] will have its `id` field set.
  Future<Approval?> upsertRow(
    _is.DatabaseSession session,
    Approval row, {
    required _is.ColumnSelections<ApprovalTable> conflictColumns,
    _is.ColumnSelections<ApprovalTable>? updateColumns,
    _is.WhereExpressionBuilder<ApprovalTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Approval>(
      row,
      conflictColumns: conflictColumns(Approval.t),
      updateColumns: updateColumns?.call(Approval.t),
      updateWhere: updateWhere?.call(Approval.t),
      transaction: transaction,
    );
  }

  /// Updates all [Approval]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Approval>> update(
    _is.DatabaseSession session,
    List<Approval> rows, {
    _is.ColumnSelections<ApprovalTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Approval>(
      rows,
      columns: columns?.call(Approval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Approval]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Approval> updateRow(
    _is.DatabaseSession session,
    Approval row, {
    _is.ColumnSelections<ApprovalTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Approval>(
      row,
      columns: columns?.call(Approval.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Approval] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Approval?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ApprovalUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Approval>(
      id,
      columnValues: columnValues(Approval.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Approval]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Approval>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ApprovalUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ApprovalTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Approval>(
      columnValues: columnValues(Approval.t.updateTable),
      where: where(Approval.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Approval]s in the list and returns the deleted rows.
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
  Future<List<Approval>> delete(
    _is.DatabaseSession session,
    List<Approval> rows, {
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Approval>(
      rows,
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Approval].
  Future<Approval> deleteRow(
    _is.DatabaseSession session,
    Approval row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Approval>(
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
  Future<List<Approval>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ApprovalTable> where,
    _is.OrderByBuilder<ApprovalTable>? orderBy,
    _is.OrderByListBuilder<ApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Approval>(
      where: where(Approval.t),
      orderBy: orderBy?.call(Approval.t),
      orderByList: orderByList?.call(Approval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ApprovalTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Approval>(
      where: where?.call(Approval.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Approval] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ApprovalTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Approval>(
      where: where(Approval.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

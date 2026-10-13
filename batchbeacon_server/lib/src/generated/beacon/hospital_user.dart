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

abstract class HospitalUser
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  HospitalUser._({
    this.id,
    required this.authUserId,
    required this.hospitalId,
    required this.role,
    required this.status,
  });

  factory HospitalUser({
    int? id,
    required _is.UuidValue authUserId,
    required int hospitalId,
    required String role,
    required String status,
  }) = _HospitalUserImpl;

  factory HospitalUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return HospitalUser(
      id: jsonSerialization['id'] as int?,
      authUserId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      hospitalId: jsonSerialization['hospitalId'] as int,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
    );
  }

  static final t = HospitalUserTable();

  static const db = HospitalUserRepository._();

  @override
  int? id;

  _is.UuidValue authUserId;

  int hospitalId;

  String role;

  String status;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [HospitalUser]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  HospitalUser copyWith({
    int? id,
    _is.UuidValue? authUserId,
    int? hospitalId,
    String? role,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HospitalUser',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'hospitalId': hospitalId,
      'role': role,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HospitalUser',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'hospitalId': hospitalId,
      'role': role,
      'status': status,
    };
  }

  static HospitalUserInclude include() {
    return HospitalUserInclude._();
  }

  static HospitalUserIncludeList includeList({
    _is.WhereExpressionBuilder<HospitalUserTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    HospitalUserInclude? include,
  }) {
    return HospitalUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HospitalUserImpl extends HospitalUser {
  _HospitalUserImpl({
    int? id,
    required _is.UuidValue authUserId,
    required int hospitalId,
    required String role,
    required String status,
  }) : super._(
         id: id,
         authUserId: authUserId,
         hospitalId: hospitalId,
         role: role,
         status: status,
       );

  /// Returns a shallow copy of this [HospitalUser]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  HospitalUser copyWith({
    Object? id = _Undefined,
    _is.UuidValue? authUserId,
    int? hospitalId,
    String? role,
    String? status,
  }) {
    return HospitalUser(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      hospitalId: hospitalId ?? this.hospitalId,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }
}

class HospitalUserUpdateTable extends _is.UpdateTable<HospitalUserTable> {
  HospitalUserUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> authUserId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.authUserId,
    value,
  );

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<String, String> role(String value) => _is.ColumnValue(
    table.role,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );
}

class HospitalUserTable extends _is.Table<int?> {
  HospitalUserTable({super.tableRelation})
    : super(tableName: 'hospital_users') {
    updateTable = HospitalUserUpdateTable(this);
    authUserId = _is.ColumnUuid(
      'authUserId',
      this,
    );
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    role = _is.ColumnString(
      'role',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
  }

  late final HospitalUserUpdateTable updateTable;

  late final _is.ColumnUuid authUserId;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnString role;

  late final _is.ColumnString status;

  @override
  List<_is.Column> get columns => [
    id,
    authUserId,
    hospitalId,
    role,
    status,
  ];
}

class HospitalUserInclude extends _is.IncludeObject {
  HospitalUserInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => HospitalUser.t;
}

class HospitalUserIncludeList extends _is.IncludeList {
  HospitalUserIncludeList._({
    _is.WhereExpressionBuilder<HospitalUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HospitalUser.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => HospitalUser.t;
}

class HospitalUserRepository {
  const HospitalUserRepository._();

  /// Returns a list of [HospitalUser]s matching the given query parameters.
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
  Future<List<HospitalUser>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalUserTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<HospitalUser>(
      where: where?.call(HospitalUser.t),
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [HospitalUser] matching the given query parameters.
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
  Future<HospitalUser?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalUserTable>? where,
    int? offset,
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<HospitalUser>(
      where: where?.call(HospitalUser.t),
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [HospitalUser] by its [id] or null if no such row exists.
  Future<HospitalUser?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<HospitalUser>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [HospitalUser]s in the list and returns the inserted rows.
  ///
  /// The returned [HospitalUser]s will have their `id` fields set.
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
  Future<List<HospitalUser>> insert(
    _is.DatabaseSession session,
    List<HospitalUser> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<HospitalUser>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [HospitalUser] and returns the inserted row.
  ///
  /// The returned [HospitalUser] will have its `id` field set.
  Future<HospitalUser> insertRow(
    _is.DatabaseSession session,
    HospitalUser row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<HospitalUser>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [HospitalUser]s in the list and returns the resulting rows.
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
  /// The returned [HospitalUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalUser>> upsert(
    _is.DatabaseSession session,
    List<HospitalUser> rows, {
    required _is.ColumnSelections<HospitalUserTable> conflictColumns,
    _is.ColumnSelections<HospitalUserTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalUserTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<HospitalUser>(
      rows,
      conflictColumns: conflictColumns(HospitalUser.t),
      updateColumns: updateColumns?.call(HospitalUser.t),
      updateWhere: updateWhere?.call(HospitalUser.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [HospitalUser] and returns the resulting row.
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
  /// The returned [HospitalUser] will have its `id` field set.
  Future<HospitalUser?> upsertRow(
    _is.DatabaseSession session,
    HospitalUser row, {
    required _is.ColumnSelections<HospitalUserTable> conflictColumns,
    _is.ColumnSelections<HospitalUserTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalUserTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<HospitalUser>(
      row,
      conflictColumns: conflictColumns(HospitalUser.t),
      updateColumns: updateColumns?.call(HospitalUser.t),
      updateWhere: updateWhere?.call(HospitalUser.t),
      transaction: transaction,
    );
  }

  /// Updates all [HospitalUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalUser>> update(
    _is.DatabaseSession session,
    List<HospitalUser> rows, {
    _is.ColumnSelections<HospitalUserTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<HospitalUser>(
      rows,
      columns: columns?.call(HospitalUser.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [HospitalUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HospitalUser> updateRow(
    _is.DatabaseSession session,
    HospitalUser row, {
    _is.ColumnSelections<HospitalUserTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<HospitalUser>(
      row,
      columns: columns?.call(HospitalUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HospitalUser] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HospitalUser?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HospitalUserUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<HospitalUser>(
      id,
      columnValues: columnValues(HospitalUser.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HospitalUser]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HospitalUser>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HospitalUserUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<HospitalUserTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<HospitalUser>(
      columnValues: columnValues(HospitalUser.t.updateTable),
      where: where(HospitalUser.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [HospitalUser]s in the list and returns the deleted rows.
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
  Future<List<HospitalUser>> delete(
    _is.DatabaseSession session,
    List<HospitalUser> rows, {
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<HospitalUser>(
      rows,
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [HospitalUser].
  Future<HospitalUser> deleteRow(
    _is.DatabaseSession session,
    HospitalUser row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HospitalUser>(
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
  Future<List<HospitalUser>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalUserTable> where,
    _is.OrderByBuilder<HospitalUserTable>? orderBy,
    _is.OrderByListBuilder<HospitalUserTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<HospitalUser>(
      where: where(HospitalUser.t),
      orderBy: orderBy?.call(HospitalUser.t),
      orderByList: orderByList?.call(HospitalUser.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalUserTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<HospitalUser>(
      where: where?.call(HospitalUser.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [HospitalUser] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalUserTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<HospitalUser>(
      where: where(HospitalUser.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

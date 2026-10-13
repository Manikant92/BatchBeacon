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

abstract class Hospital
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Hospital._({
    this.id,
    required this.name,
    required this.city,
    required this.organizationType,
    required this.status,
  });

  factory Hospital({
    int? id,
    required String name,
    required String city,
    required String organizationType,
    required String status,
  }) = _HospitalImpl;

  factory Hospital.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hospital(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      city: jsonSerialization['city'] as String,
      organizationType: jsonSerialization['organizationType'] as String,
      status: jsonSerialization['status'] as String,
    );
  }

  static final t = HospitalTable();

  static const db = HospitalRepository._();

  @override
  int? id;

  String name;

  String city;

  String organizationType;

  String status;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Hospital]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Hospital copyWith({
    int? id,
    String? name,
    String? city,
    String? organizationType,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Hospital',
      if (id != null) 'id': id,
      'name': name,
      'city': city,
      'organizationType': organizationType,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Hospital',
      if (id != null) 'id': id,
      'name': name,
      'city': city,
      'organizationType': organizationType,
      'status': status,
    };
  }

  static HospitalInclude include() {
    return HospitalInclude._();
  }

  static HospitalIncludeList includeList({
    _is.WhereExpressionBuilder<HospitalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    HospitalInclude? include,
  }) {
    return HospitalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HospitalImpl extends Hospital {
  _HospitalImpl({
    int? id,
    required String name,
    required String city,
    required String organizationType,
    required String status,
  }) : super._(
         id: id,
         name: name,
         city: city,
         organizationType: organizationType,
         status: status,
       );

  /// Returns a shallow copy of this [Hospital]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Hospital copyWith({
    Object? id = _Undefined,
    String? name,
    String? city,
    String? organizationType,
    String? status,
  }) {
    return Hospital(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      organizationType: organizationType ?? this.organizationType,
      status: status ?? this.status,
    );
  }
}

class HospitalUpdateTable extends _is.UpdateTable<HospitalTable> {
  HospitalUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> city(String value) => _is.ColumnValue(
    table.city,
    value,
  );

  _is.ColumnValue<String, String> organizationType(String value) =>
      _is.ColumnValue(
        table.organizationType,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );
}

class HospitalTable extends _is.Table<int?> {
  HospitalTable({super.tableRelation}) : super(tableName: 'hospitals') {
    updateTable = HospitalUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    city = _is.ColumnString(
      'city',
      this,
    );
    organizationType = _is.ColumnString(
      'organizationType',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
  }

  late final HospitalUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString city;

  late final _is.ColumnString organizationType;

  late final _is.ColumnString status;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    city,
    organizationType,
    status,
  ];
}

class HospitalInclude extends _is.IncludeObject {
  HospitalInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Hospital.t;
}

class HospitalIncludeList extends _is.IncludeList {
  HospitalIncludeList._({
    _is.WhereExpressionBuilder<HospitalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Hospital.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Hospital.t;
}

class HospitalRepository {
  const HospitalRepository._();

  /// Returns a list of [Hospital]s matching the given query parameters.
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
  Future<List<Hospital>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Hospital>(
      where: where?.call(Hospital.t),
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Hospital] matching the given query parameters.
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
  Future<Hospital?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalTable>? where,
    int? offset,
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Hospital>(
      where: where?.call(Hospital.t),
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Hospital] by its [id] or null if no such row exists.
  Future<Hospital?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Hospital>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Hospital]s in the list and returns the inserted rows.
  ///
  /// The returned [Hospital]s will have their `id` fields set.
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
  Future<List<Hospital>> insert(
    _is.DatabaseSession session,
    List<Hospital> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Hospital>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Hospital] and returns the inserted row.
  ///
  /// The returned [Hospital] will have its `id` field set.
  Future<Hospital> insertRow(
    _is.DatabaseSession session,
    Hospital row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Hospital>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Hospital]s in the list and returns the resulting rows.
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
  /// The returned [Hospital]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Hospital>> upsert(
    _is.DatabaseSession session,
    List<Hospital> rows, {
    required _is.ColumnSelections<HospitalTable> conflictColumns,
    _is.ColumnSelections<HospitalTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Hospital>(
      rows,
      conflictColumns: conflictColumns(Hospital.t),
      updateColumns: updateColumns?.call(Hospital.t),
      updateWhere: updateWhere?.call(Hospital.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Hospital] and returns the resulting row.
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
  /// The returned [Hospital] will have its `id` field set.
  Future<Hospital?> upsertRow(
    _is.DatabaseSession session,
    Hospital row, {
    required _is.ColumnSelections<HospitalTable> conflictColumns,
    _is.ColumnSelections<HospitalTable>? updateColumns,
    _is.WhereExpressionBuilder<HospitalTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Hospital>(
      row,
      conflictColumns: conflictColumns(Hospital.t),
      updateColumns: updateColumns?.call(Hospital.t),
      updateWhere: updateWhere?.call(Hospital.t),
      transaction: transaction,
    );
  }

  /// Updates all [Hospital]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Hospital>> update(
    _is.DatabaseSession session,
    List<Hospital> rows, {
    _is.ColumnSelections<HospitalTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Hospital>(
      rows,
      columns: columns?.call(Hospital.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Hospital]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Hospital> updateRow(
    _is.DatabaseSession session,
    Hospital row, {
    _is.ColumnSelections<HospitalTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Hospital>(
      row,
      columns: columns?.call(Hospital.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Hospital] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Hospital?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HospitalUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Hospital>(
      id,
      columnValues: columnValues(Hospital.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Hospital]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Hospital>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HospitalUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<HospitalTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Hospital>(
      columnValues: columnValues(Hospital.t.updateTable),
      where: where(Hospital.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Hospital]s in the list and returns the deleted rows.
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
  Future<List<Hospital>> delete(
    _is.DatabaseSession session,
    List<Hospital> rows, {
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Hospital>(
      rows,
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Hospital].
  Future<Hospital> deleteRow(
    _is.DatabaseSession session,
    Hospital row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Hospital>(
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
  Future<List<Hospital>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalTable> where,
    _is.OrderByBuilder<HospitalTable>? orderBy,
    _is.OrderByListBuilder<HospitalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Hospital>(
      where: where(Hospital.t),
      orderBy: orderBy?.call(Hospital.t),
      orderByList: orderByList?.call(Hospital.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HospitalTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Hospital>(
      where: where?.call(Hospital.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Hospital] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HospitalTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Hospital>(
      where: where(Hospital.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

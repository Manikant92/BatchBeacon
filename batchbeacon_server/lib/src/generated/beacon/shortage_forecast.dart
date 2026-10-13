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

abstract class ShortageForecast
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  ShortageForecast._({
    this.id,
    required this.hospitalId,
    required this.medicineId,
    required this.calculatedAt,
    required this.averageDailyConsumption,
    this.projectedRunoutDate,
    required this.daysOfCover,
    required this.requiredQuantity,
    required this.riskLevel,
    required this.forecastMethod,
  });

  factory ShortageForecast({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime calculatedAt,
    required double averageDailyConsumption,
    DateTime? projectedRunoutDate,
    required double daysOfCover,
    required int requiredQuantity,
    required String riskLevel,
    required String forecastMethod,
  }) = _ShortageForecastImpl;

  factory ShortageForecast.fromJson(Map<String, dynamic> jsonSerialization) {
    return ShortageForecast(
      id: jsonSerialization['id'] as int?,
      hospitalId: jsonSerialization['hospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      calculatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['calculatedAt'],
      ),
      averageDailyConsumption:
          (jsonSerialization['averageDailyConsumption'] as num).toDouble(),
      projectedRunoutDate: jsonSerialization['projectedRunoutDate'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['projectedRunoutDate'],
            ),
      daysOfCover: (jsonSerialization['daysOfCover'] as num).toDouble(),
      requiredQuantity: jsonSerialization['requiredQuantity'] as int,
      riskLevel: jsonSerialization['riskLevel'] as String,
      forecastMethod: jsonSerialization['forecastMethod'] as String,
    );
  }

  static final t = ShortageForecastTable();

  static const db = ShortageForecastRepository._();

  @override
  int? id;

  int hospitalId;

  int medicineId;

  DateTime calculatedAt;

  double averageDailyConsumption;

  DateTime? projectedRunoutDate;

  double daysOfCover;

  int requiredQuantity;

  String riskLevel;

  String forecastMethod;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ShortageForecast]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ShortageForecast copyWith({
    int? id,
    int? hospitalId,
    int? medicineId,
    DateTime? calculatedAt,
    double? averageDailyConsumption,
    DateTime? projectedRunoutDate,
    double? daysOfCover,
    int? requiredQuantity,
    String? riskLevel,
    String? forecastMethod,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ShortageForecast',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'calculatedAt': calculatedAt.toJson(),
      'averageDailyConsumption': averageDailyConsumption,
      if (projectedRunoutDate != null)
        'projectedRunoutDate': projectedRunoutDate?.toJson(),
      'daysOfCover': daysOfCover,
      'requiredQuantity': requiredQuantity,
      'riskLevel': riskLevel,
      'forecastMethod': forecastMethod,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ShortageForecast',
      if (id != null) 'id': id,
      'hospitalId': hospitalId,
      'medicineId': medicineId,
      'calculatedAt': calculatedAt.toJson(),
      'averageDailyConsumption': averageDailyConsumption,
      if (projectedRunoutDate != null)
        'projectedRunoutDate': projectedRunoutDate?.toJson(),
      'daysOfCover': daysOfCover,
      'requiredQuantity': requiredQuantity,
      'riskLevel': riskLevel,
      'forecastMethod': forecastMethod,
    };
  }

  static ShortageForecastInclude include() {
    return ShortageForecastInclude._();
  }

  static ShortageForecastIncludeList includeList({
    _is.WhereExpressionBuilder<ShortageForecastTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    ShortageForecastInclude? include,
  }) {
    return ShortageForecastIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShortageForecastImpl extends ShortageForecast {
  _ShortageForecastImpl({
    int? id,
    required int hospitalId,
    required int medicineId,
    required DateTime calculatedAt,
    required double averageDailyConsumption,
    DateTime? projectedRunoutDate,
    required double daysOfCover,
    required int requiredQuantity,
    required String riskLevel,
    required String forecastMethod,
  }) : super._(
         id: id,
         hospitalId: hospitalId,
         medicineId: medicineId,
         calculatedAt: calculatedAt,
         averageDailyConsumption: averageDailyConsumption,
         projectedRunoutDate: projectedRunoutDate,
         daysOfCover: daysOfCover,
         requiredQuantity: requiredQuantity,
         riskLevel: riskLevel,
         forecastMethod: forecastMethod,
       );

  /// Returns a shallow copy of this [ShortageForecast]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ShortageForecast copyWith({
    Object? id = _Undefined,
    int? hospitalId,
    int? medicineId,
    DateTime? calculatedAt,
    double? averageDailyConsumption,
    Object? projectedRunoutDate = _Undefined,
    double? daysOfCover,
    int? requiredQuantity,
    String? riskLevel,
    String? forecastMethod,
  }) {
    return ShortageForecast(
      id: id is int? ? id : this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      medicineId: medicineId ?? this.medicineId,
      calculatedAt: calculatedAt ?? this.calculatedAt,
      averageDailyConsumption:
          averageDailyConsumption ?? this.averageDailyConsumption,
      projectedRunoutDate: projectedRunoutDate is DateTime?
          ? projectedRunoutDate
          : this.projectedRunoutDate,
      daysOfCover: daysOfCover ?? this.daysOfCover,
      requiredQuantity: requiredQuantity ?? this.requiredQuantity,
      riskLevel: riskLevel ?? this.riskLevel,
      forecastMethod: forecastMethod ?? this.forecastMethod,
    );
  }
}

class ShortageForecastUpdateTable
    extends _is.UpdateTable<ShortageForecastTable> {
  ShortageForecastUpdateTable(super.table);

  _is.ColumnValue<int, int> hospitalId(int value) => _is.ColumnValue(
    table.hospitalId,
    value,
  );

  _is.ColumnValue<int, int> medicineId(int value) => _is.ColumnValue(
    table.medicineId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> calculatedAt(DateTime value) =>
      _is.ColumnValue(
        table.calculatedAt,
        value,
      );

  _is.ColumnValue<double, double> averageDailyConsumption(double value) =>
      _is.ColumnValue(
        table.averageDailyConsumption,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> projectedRunoutDate(DateTime? value) =>
      _is.ColumnValue(
        table.projectedRunoutDate,
        value,
      );

  _is.ColumnValue<double, double> daysOfCover(double value) => _is.ColumnValue(
    table.daysOfCover,
    value,
  );

  _is.ColumnValue<int, int> requiredQuantity(int value) => _is.ColumnValue(
    table.requiredQuantity,
    value,
  );

  _is.ColumnValue<String, String> riskLevel(String value) => _is.ColumnValue(
    table.riskLevel,
    value,
  );

  _is.ColumnValue<String, String> forecastMethod(String value) =>
      _is.ColumnValue(
        table.forecastMethod,
        value,
      );
}

class ShortageForecastTable extends _is.Table<int?> {
  ShortageForecastTable({super.tableRelation})
    : super(tableName: 'shortage_forecasts') {
    updateTable = ShortageForecastUpdateTable(this);
    hospitalId = _is.ColumnInt(
      'hospitalId',
      this,
    );
    medicineId = _is.ColumnInt(
      'medicineId',
      this,
    );
    calculatedAt = _is.ColumnDateTime(
      'calculatedAt',
      this,
    );
    averageDailyConsumption = _is.ColumnDouble(
      'averageDailyConsumption',
      this,
    );
    projectedRunoutDate = _is.ColumnDateTime(
      'projectedRunoutDate',
      this,
    );
    daysOfCover = _is.ColumnDouble(
      'daysOfCover',
      this,
    );
    requiredQuantity = _is.ColumnInt(
      'requiredQuantity',
      this,
    );
    riskLevel = _is.ColumnString(
      'riskLevel',
      this,
    );
    forecastMethod = _is.ColumnString(
      'forecastMethod',
      this,
    );
  }

  late final ShortageForecastUpdateTable updateTable;

  late final _is.ColumnInt hospitalId;

  late final _is.ColumnInt medicineId;

  late final _is.ColumnDateTime calculatedAt;

  late final _is.ColumnDouble averageDailyConsumption;

  late final _is.ColumnDateTime projectedRunoutDate;

  late final _is.ColumnDouble daysOfCover;

  late final _is.ColumnInt requiredQuantity;

  late final _is.ColumnString riskLevel;

  late final _is.ColumnString forecastMethod;

  @override
  List<_is.Column> get columns => [
    id,
    hospitalId,
    medicineId,
    calculatedAt,
    averageDailyConsumption,
    projectedRunoutDate,
    daysOfCover,
    requiredQuantity,
    riskLevel,
    forecastMethod,
  ];
}

class ShortageForecastInclude extends _is.IncludeObject {
  ShortageForecastInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ShortageForecast.t;
}

class ShortageForecastIncludeList extends _is.IncludeList {
  ShortageForecastIncludeList._({
    _is.WhereExpressionBuilder<ShortageForecastTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ShortageForecast.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ShortageForecast.t;
}

class ShortageForecastRepository {
  const ShortageForecastRepository._();

  /// Returns a list of [ShortageForecast]s matching the given query parameters.
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
  Future<List<ShortageForecast>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShortageForecastTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ShortageForecast>(
      where: where?.call(ShortageForecast.t),
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ShortageForecast] matching the given query parameters.
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
  Future<ShortageForecast?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShortageForecastTable>? where,
    int? offset,
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ShortageForecast>(
      where: where?.call(ShortageForecast.t),
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ShortageForecast] by its [id] or null if no such row exists.
  Future<ShortageForecast?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ShortageForecast>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ShortageForecast]s in the list and returns the inserted rows.
  ///
  /// The returned [ShortageForecast]s will have their `id` fields set.
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
  Future<List<ShortageForecast>> insert(
    _is.DatabaseSession session,
    List<ShortageForecast> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ShortageForecast>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ShortageForecast] and returns the inserted row.
  ///
  /// The returned [ShortageForecast] will have its `id` field set.
  Future<ShortageForecast> insertRow(
    _is.DatabaseSession session,
    ShortageForecast row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ShortageForecast>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ShortageForecast]s in the list and returns the resulting rows.
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
  /// The returned [ShortageForecast]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShortageForecast>> upsert(
    _is.DatabaseSession session,
    List<ShortageForecast> rows, {
    required _is.ColumnSelections<ShortageForecastTable> conflictColumns,
    _is.ColumnSelections<ShortageForecastTable>? updateColumns,
    _is.WhereExpressionBuilder<ShortageForecastTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ShortageForecast>(
      rows,
      conflictColumns: conflictColumns(ShortageForecast.t),
      updateColumns: updateColumns?.call(ShortageForecast.t),
      updateWhere: updateWhere?.call(ShortageForecast.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ShortageForecast] and returns the resulting row.
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
  /// The returned [ShortageForecast] will have its `id` field set.
  Future<ShortageForecast?> upsertRow(
    _is.DatabaseSession session,
    ShortageForecast row, {
    required _is.ColumnSelections<ShortageForecastTable> conflictColumns,
    _is.ColumnSelections<ShortageForecastTable>? updateColumns,
    _is.WhereExpressionBuilder<ShortageForecastTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ShortageForecast>(
      row,
      conflictColumns: conflictColumns(ShortageForecast.t),
      updateColumns: updateColumns?.call(ShortageForecast.t),
      updateWhere: updateWhere?.call(ShortageForecast.t),
      transaction: transaction,
    );
  }

  /// Updates all [ShortageForecast]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShortageForecast>> update(
    _is.DatabaseSession session,
    List<ShortageForecast> rows, {
    _is.ColumnSelections<ShortageForecastTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ShortageForecast>(
      rows,
      columns: columns?.call(ShortageForecast.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ShortageForecast]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ShortageForecast> updateRow(
    _is.DatabaseSession session,
    ShortageForecast row, {
    _is.ColumnSelections<ShortageForecastTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ShortageForecast>(
      row,
      columns: columns?.call(ShortageForecast.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ShortageForecast] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ShortageForecast?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ShortageForecastUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ShortageForecast>(
      id,
      columnValues: columnValues(ShortageForecast.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ShortageForecast]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ShortageForecast>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ShortageForecastUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<ShortageForecastTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ShortageForecast>(
      columnValues: columnValues(ShortageForecast.t.updateTable),
      where: where(ShortageForecast.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ShortageForecast]s in the list and returns the deleted rows.
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
  Future<List<ShortageForecast>> delete(
    _is.DatabaseSession session,
    List<ShortageForecast> rows, {
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ShortageForecast>(
      rows,
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ShortageForecast].
  Future<ShortageForecast> deleteRow(
    _is.DatabaseSession session,
    ShortageForecast row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ShortageForecast>(
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
  Future<List<ShortageForecast>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShortageForecastTable> where,
    _is.OrderByBuilder<ShortageForecastTable>? orderBy,
    _is.OrderByListBuilder<ShortageForecastTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ShortageForecast>(
      where: where(ShortageForecast.t),
      orderBy: orderBy?.call(ShortageForecast.t),
      orderByList: orderByList?.call(ShortageForecast.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ShortageForecastTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ShortageForecast>(
      where: where?.call(ShortageForecast.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ShortageForecast] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ShortageForecastTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ShortageForecast>(
      where: where(ShortageForecast.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

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

abstract class RescueProposal
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RescueProposal._({
    this.id,
    required this.sourceHospitalId,
    required this.destinationHospitalId,
    required this.medicineId,
    required this.inventoryBatchId,
    required this.proposedQuantity,
    required this.expiryDate,
    required this.proposedArrivalAt,
    required this.status,
    required this.forecastReferenceId,
    required this.explanation,
    required this.requestKey,
    required this.createdAt,
  });

  factory RescueProposal({
    int? id,
    required int sourceHospitalId,
    required int destinationHospitalId,
    required int medicineId,
    required int inventoryBatchId,
    required int proposedQuantity,
    required DateTime expiryDate,
    required DateTime proposedArrivalAt,
    required String status,
    required int forecastReferenceId,
    required String explanation,
    required String requestKey,
    required DateTime createdAt,
  }) = _RescueProposalImpl;

  factory RescueProposal.fromJson(Map<String, dynamic> jsonSerialization) {
    return RescueProposal(
      id: jsonSerialization['id'] as int?,
      sourceHospitalId: jsonSerialization['sourceHospitalId'] as int,
      destinationHospitalId: jsonSerialization['destinationHospitalId'] as int,
      medicineId: jsonSerialization['medicineId'] as int,
      inventoryBatchId: jsonSerialization['inventoryBatchId'] as int,
      proposedQuantity: jsonSerialization['proposedQuantity'] as int,
      expiryDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiryDate'],
      ),
      proposedArrivalAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['proposedArrivalAt'],
      ),
      status: jsonSerialization['status'] as String,
      forecastReferenceId: jsonSerialization['forecastReferenceId'] as int,
      explanation: jsonSerialization['explanation'] as String,
      requestKey: jsonSerialization['requestKey'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = RescueProposalTable();

  static const db = RescueProposalRepository._();

  @override
  int? id;

  int sourceHospitalId;

  int destinationHospitalId;

  int medicineId;

  int inventoryBatchId;

  int proposedQuantity;

  DateTime expiryDate;

  DateTime proposedArrivalAt;

  String status;

  int forecastReferenceId;

  String explanation;

  String requestKey;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RescueProposal]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RescueProposal copyWith({
    int? id,
    int? sourceHospitalId,
    int? destinationHospitalId,
    int? medicineId,
    int? inventoryBatchId,
    int? proposedQuantity,
    DateTime? expiryDate,
    DateTime? proposedArrivalAt,
    String? status,
    int? forecastReferenceId,
    String? explanation,
    String? requestKey,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RescueProposal',
      if (id != null) 'id': id,
      'sourceHospitalId': sourceHospitalId,
      'destinationHospitalId': destinationHospitalId,
      'medicineId': medicineId,
      'inventoryBatchId': inventoryBatchId,
      'proposedQuantity': proposedQuantity,
      'expiryDate': expiryDate.toJson(),
      'proposedArrivalAt': proposedArrivalAt.toJson(),
      'status': status,
      'forecastReferenceId': forecastReferenceId,
      'explanation': explanation,
      'requestKey': requestKey,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RescueProposal',
      if (id != null) 'id': id,
      'sourceHospitalId': sourceHospitalId,
      'destinationHospitalId': destinationHospitalId,
      'medicineId': medicineId,
      'inventoryBatchId': inventoryBatchId,
      'proposedQuantity': proposedQuantity,
      'expiryDate': expiryDate.toJson(),
      'proposedArrivalAt': proposedArrivalAt.toJson(),
      'status': status,
      'forecastReferenceId': forecastReferenceId,
      'explanation': explanation,
      'requestKey': requestKey,
      'createdAt': createdAt.toJson(),
    };
  }

  static RescueProposalInclude include() {
    return RescueProposalInclude._();
  }

  static RescueProposalIncludeList includeList({
    _is.WhereExpressionBuilder<RescueProposalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    RescueProposalInclude? include,
  }) {
    return RescueProposalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RescueProposalImpl extends RescueProposal {
  _RescueProposalImpl({
    int? id,
    required int sourceHospitalId,
    required int destinationHospitalId,
    required int medicineId,
    required int inventoryBatchId,
    required int proposedQuantity,
    required DateTime expiryDate,
    required DateTime proposedArrivalAt,
    required String status,
    required int forecastReferenceId,
    required String explanation,
    required String requestKey,
    required DateTime createdAt,
  }) : super._(
         id: id,
         sourceHospitalId: sourceHospitalId,
         destinationHospitalId: destinationHospitalId,
         medicineId: medicineId,
         inventoryBatchId: inventoryBatchId,
         proposedQuantity: proposedQuantity,
         expiryDate: expiryDate,
         proposedArrivalAt: proposedArrivalAt,
         status: status,
         forecastReferenceId: forecastReferenceId,
         explanation: explanation,
         requestKey: requestKey,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RescueProposal]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RescueProposal copyWith({
    Object? id = _Undefined,
    int? sourceHospitalId,
    int? destinationHospitalId,
    int? medicineId,
    int? inventoryBatchId,
    int? proposedQuantity,
    DateTime? expiryDate,
    DateTime? proposedArrivalAt,
    String? status,
    int? forecastReferenceId,
    String? explanation,
    String? requestKey,
    DateTime? createdAt,
  }) {
    return RescueProposal(
      id: id is int? ? id : this.id,
      sourceHospitalId: sourceHospitalId ?? this.sourceHospitalId,
      destinationHospitalId:
          destinationHospitalId ?? this.destinationHospitalId,
      medicineId: medicineId ?? this.medicineId,
      inventoryBatchId: inventoryBatchId ?? this.inventoryBatchId,
      proposedQuantity: proposedQuantity ?? this.proposedQuantity,
      expiryDate: expiryDate ?? this.expiryDate,
      proposedArrivalAt: proposedArrivalAt ?? this.proposedArrivalAt,
      status: status ?? this.status,
      forecastReferenceId: forecastReferenceId ?? this.forecastReferenceId,
      explanation: explanation ?? this.explanation,
      requestKey: requestKey ?? this.requestKey,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RescueProposalUpdateTable extends _is.UpdateTable<RescueProposalTable> {
  RescueProposalUpdateTable(super.table);

  _is.ColumnValue<int, int> sourceHospitalId(int value) => _is.ColumnValue(
    table.sourceHospitalId,
    value,
  );

  _is.ColumnValue<int, int> destinationHospitalId(int value) => _is.ColumnValue(
    table.destinationHospitalId,
    value,
  );

  _is.ColumnValue<int, int> medicineId(int value) => _is.ColumnValue(
    table.medicineId,
    value,
  );

  _is.ColumnValue<int, int> inventoryBatchId(int value) => _is.ColumnValue(
    table.inventoryBatchId,
    value,
  );

  _is.ColumnValue<int, int> proposedQuantity(int value) => _is.ColumnValue(
    table.proposedQuantity,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> expiryDate(DateTime value) =>
      _is.ColumnValue(
        table.expiryDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> proposedArrivalAt(DateTime value) =>
      _is.ColumnValue(
        table.proposedArrivalAt,
        value,
      );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<int, int> forecastReferenceId(int value) => _is.ColumnValue(
    table.forecastReferenceId,
    value,
  );

  _is.ColumnValue<String, String> explanation(String value) => _is.ColumnValue(
    table.explanation,
    value,
  );

  _is.ColumnValue<String, String> requestKey(String value) => _is.ColumnValue(
    table.requestKey,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RescueProposalTable extends _is.Table<int?> {
  RescueProposalTable({super.tableRelation})
    : super(tableName: 'rescue_proposals') {
    updateTable = RescueProposalUpdateTable(this);
    sourceHospitalId = _is.ColumnInt(
      'sourceHospitalId',
      this,
    );
    destinationHospitalId = _is.ColumnInt(
      'destinationHospitalId',
      this,
    );
    medicineId = _is.ColumnInt(
      'medicineId',
      this,
    );
    inventoryBatchId = _is.ColumnInt(
      'inventoryBatchId',
      this,
    );
    proposedQuantity = _is.ColumnInt(
      'proposedQuantity',
      this,
    );
    expiryDate = _is.ColumnDateTime(
      'expiryDate',
      this,
    );
    proposedArrivalAt = _is.ColumnDateTime(
      'proposedArrivalAt',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    forecastReferenceId = _is.ColumnInt(
      'forecastReferenceId',
      this,
    );
    explanation = _is.ColumnString(
      'explanation',
      this,
    );
    requestKey = _is.ColumnString(
      'requestKey',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RescueProposalUpdateTable updateTable;

  late final _is.ColumnInt sourceHospitalId;

  late final _is.ColumnInt destinationHospitalId;

  late final _is.ColumnInt medicineId;

  late final _is.ColumnInt inventoryBatchId;

  late final _is.ColumnInt proposedQuantity;

  late final _is.ColumnDateTime expiryDate;

  late final _is.ColumnDateTime proposedArrivalAt;

  late final _is.ColumnString status;

  late final _is.ColumnInt forecastReferenceId;

  late final _is.ColumnString explanation;

  late final _is.ColumnString requestKey;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    sourceHospitalId,
    destinationHospitalId,
    medicineId,
    inventoryBatchId,
    proposedQuantity,
    expiryDate,
    proposedArrivalAt,
    status,
    forecastReferenceId,
    explanation,
    requestKey,
    createdAt,
  ];
}

class RescueProposalInclude extends _is.IncludeObject {
  RescueProposalInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RescueProposal.t;
}

class RescueProposalIncludeList extends _is.IncludeList {
  RescueProposalIncludeList._({
    _is.WhereExpressionBuilder<RescueProposalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RescueProposal.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RescueProposal.t;
}

class RescueProposalRepository {
  const RescueProposalRepository._();

  /// Returns a list of [RescueProposal]s matching the given query parameters.
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
  Future<List<RescueProposal>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RescueProposalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RescueProposal>(
      where: where?.call(RescueProposal.t),
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RescueProposal] matching the given query parameters.
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
  Future<RescueProposal?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RescueProposalTable>? where,
    int? offset,
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RescueProposal>(
      where: where?.call(RescueProposal.t),
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RescueProposal] by its [id] or null if no such row exists.
  Future<RescueProposal?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RescueProposal>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RescueProposal]s in the list and returns the inserted rows.
  ///
  /// The returned [RescueProposal]s will have their `id` fields set.
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
  Future<List<RescueProposal>> insert(
    _is.DatabaseSession session,
    List<RescueProposal> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RescueProposal>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RescueProposal] and returns the inserted row.
  ///
  /// The returned [RescueProposal] will have its `id` field set.
  Future<RescueProposal> insertRow(
    _is.DatabaseSession session,
    RescueProposal row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RescueProposal>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RescueProposal]s in the list and returns the resulting rows.
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
  /// The returned [RescueProposal]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RescueProposal>> upsert(
    _is.DatabaseSession session,
    List<RescueProposal> rows, {
    required _is.ColumnSelections<RescueProposalTable> conflictColumns,
    _is.ColumnSelections<RescueProposalTable>? updateColumns,
    _is.WhereExpressionBuilder<RescueProposalTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RescueProposal>(
      rows,
      conflictColumns: conflictColumns(RescueProposal.t),
      updateColumns: updateColumns?.call(RescueProposal.t),
      updateWhere: updateWhere?.call(RescueProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RescueProposal] and returns the resulting row.
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
  /// The returned [RescueProposal] will have its `id` field set.
  Future<RescueProposal?> upsertRow(
    _is.DatabaseSession session,
    RescueProposal row, {
    required _is.ColumnSelections<RescueProposalTable> conflictColumns,
    _is.ColumnSelections<RescueProposalTable>? updateColumns,
    _is.WhereExpressionBuilder<RescueProposalTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RescueProposal>(
      row,
      conflictColumns: conflictColumns(RescueProposal.t),
      updateColumns: updateColumns?.call(RescueProposal.t),
      updateWhere: updateWhere?.call(RescueProposal.t),
      transaction: transaction,
    );
  }

  /// Updates all [RescueProposal]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RescueProposal>> update(
    _is.DatabaseSession session,
    List<RescueProposal> rows, {
    _is.ColumnSelections<RescueProposalTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RescueProposal>(
      rows,
      columns: columns?.call(RescueProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RescueProposal]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RescueProposal> updateRow(
    _is.DatabaseSession session,
    RescueProposal row, {
    _is.ColumnSelections<RescueProposalTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RescueProposal>(
      row,
      columns: columns?.call(RescueProposal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RescueProposal] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RescueProposal?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RescueProposalUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RescueProposal>(
      id,
      columnValues: columnValues(RescueProposal.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RescueProposal]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RescueProposal>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RescueProposalUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RescueProposalTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RescueProposal>(
      columnValues: columnValues(RescueProposal.t.updateTable),
      where: where(RescueProposal.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RescueProposal]s in the list and returns the deleted rows.
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
  Future<List<RescueProposal>> delete(
    _is.DatabaseSession session,
    List<RescueProposal> rows, {
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RescueProposal>(
      rows,
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RescueProposal].
  Future<RescueProposal> deleteRow(
    _is.DatabaseSession session,
    RescueProposal row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RescueProposal>(
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
  Future<List<RescueProposal>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RescueProposalTable> where,
    _is.OrderByBuilder<RescueProposalTable>? orderBy,
    _is.OrderByListBuilder<RescueProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RescueProposal>(
      where: where(RescueProposal.t),
      orderBy: orderBy?.call(RescueProposal.t),
      orderByList: orderByList?.call(RescueProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RescueProposalTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RescueProposal>(
      where: where?.call(RescueProposal.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RescueProposal] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RescueProposalTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RescueProposal>(
      where: where(RescueProposal.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

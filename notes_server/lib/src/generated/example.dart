/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Note extends _i1.TableRow implements _i1.ProtocolSerialization {
  Note._({
    int? id,
    required this.name,
    required this.data,
    required this.text,
  }) : super(id);

  factory Note({
    int? id,
    required String name,
    required int data,
    required String text,
  }) = _NoteImpl;

  factory Note.fromJson(Map<String, dynamic> jsonSerialization) {
    return Note(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      data: jsonSerialization['data'] as int,
      text: jsonSerialization['text'] as String,
    );
  }

  static final t = NoteTable();

  static const db = NoteRepository._();

  String name;

  int data;

  String text;

  @override
  _i1.Table get table => t;

  Note copyWith({
    int? id,
    String? name,
    int? data,
    String? text,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'data': data,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'data': data,
      'text': text,
    };
  }

  static NoteInclude include() {
    return NoteInclude._();
  }

  static NoteIncludeList includeList({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    NoteInclude? include,
  }) {
    return NoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Note.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Note.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoteImpl extends Note {
  _NoteImpl({
    int? id,
    required String name,
    required int data,
    required String text,
  }) : super._(
          id: id,
          name: name,
          data: data,
          text: text,
        );

  @override
  Note copyWith({
    Object? id = _Undefined,
    String? name,
    int? data,
    String? text,
  }) {
    return Note(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      data: data ?? this.data,
      text: text ?? this.text,
    );
  }
}

class NoteTable extends _i1.Table {
  NoteTable({super.tableRelation}) : super(tableName: 'note') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    data = _i1.ColumnInt(
      'data',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt data;

  late final _i1.ColumnString text;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        data,
        text,
      ];
}

class NoteInclude extends _i1.IncludeObject {
  NoteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Note.t;
}

class NoteIncludeList extends _i1.IncludeList {
  NoteIncludeList._({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Note.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Note.t;
}

class NoteRepository {
  const NoteRepository._();

  Future<List<Note>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Note?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Note?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Note>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Note>> insert(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Note>(
      rows,
      transaction: transaction,
    );
  }

  Future<Note> insertRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Note>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Note>> update(
    _i1.Session session,
    List<Note> rows, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Note>(
      rows,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  Future<Note> updateRow(
    _i1.Session session,
    Note row, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Note>(
      row,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  Future<List<Note>> delete(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Note>(
      rows,
      transaction: transaction,
    );
  }

  Future<Note> deleteRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Note>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Note>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Note>(
      where: where(Note.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Note>(
      where: where?.call(Note.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

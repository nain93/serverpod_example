/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Note implements _i1.SerializableModel {
  Note._({
    this.id,
    required this.name,
    required this.data,
    required this.text,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int data;

  String text;

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
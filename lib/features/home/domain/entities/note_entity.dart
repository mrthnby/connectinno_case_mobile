import 'dart:convert';

import 'package:flutter_quill/quill_delta.dart';
import 'package:uuid/uuid.dart';

/// Represents a single note with rich text content.
///
/// Stores metadata such as title, creation and update timestamps,
/// and an optional local database ID. Can serialize/deserialize
/// Quill Delta content to JSON for storage or network transfer.
final class NoteEntity {
  /// Creates a [NoteEntity] with required fields.
  ///
  /// If [uid] is not provided, a new UUID is generated.
  NoteEntity({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    String? uid,
    this.localId,
  }) : uid = uid ?? const Uuid().v4();

  /// Creates a [NoteEntity] from a JSON string representing Quill content.
  ///
  /// [title]: The note's title.
  /// [contentString]: JSON-encoded string of Quill Delta operations.
  /// [createdAt]: Creation timestamp.
  /// [updatedAt]: Last update timestamp.
  /// [localId]: Optional local database ID.
  /// [uid]: Optional unique identifier; generated automatically if null.
  factory NoteEntity.fromContentString({
    required String title,
    required String contentString,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? localId,
    String? uid,
  }) {
    final jsonData = jsonDecode(contentString) as List<dynamic>;
    final delta = Delta.fromJson(jsonData);
    return NoteEntity(
      uid: uid,
      title: title,
      content: delta,
      createdAt: createdAt,
      updatedAt: updatedAt,
      localId: localId,
    );
  }

  /// Unique identifier for the note.
  final String uid;

  /// Title of the note.
  final String title;

  /// Timestamp when the note was created.
  final DateTime createdAt;

  /// Timestamp when the note was last updated.
  final DateTime updatedAt;

  /// Optional local database ID.
  int? localId;

  /// Rich text content of the note using Quill's Delta format.
  Delta content;

  /// JSON-encoded string of the note content.
  ///
  /// Useful for storing the note content in databases or sending over network.
  String get contentJsonString => jsonEncode(content.toJson());

  /// Sets the note content from a JSON-encoded string.
  set contentJsonString(String jsonString) {
    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    content = Delta.fromJson(jsonData);
  }

  /// Creates a copy of the note with updated fields.
  ///
  /// Useful for immutably updating note properties while keeping
  /// the original note unchanged.
  NoteEntity copyWith({
    String? uid,
    String? title,
    Delta? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? localId,
  }) => NoteEntity(
    uid: uid ?? this.uid,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    localId: localId ?? this.localId,
  );
}

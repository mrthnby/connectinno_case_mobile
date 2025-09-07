import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

/// Represents a note object in the local database and maps to the domain entity [NoteEntity].
@unfreezed
sealed class NoteModel with _$NoteModel {
  /// Creates a new [NoteModel].
  ///
  /// [uid] is the unique identifier of the note.
  /// [title] is the title of the note.
  /// [content] stores the note's content as a JSON string.
  /// [createdAt] stores the creation date of the note.
  /// [updatedAt] stores the last updated date of the note.
  /// [localId] is the ObjectBox primary key. Its not included in the JSON map.
  @Entity(realClass: NoteModel)
  factory NoteModel({
    required String uid,
    required String title,
    required String content,
    @Property(type: PropertyType.date) required DateTime createdAt,
    @Property(type: PropertyType.date) required DateTime updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Id(assignable: true)
    int? localId,
  }) = _NoteModel;

  /// Creates a [NoteModel] from a JSON map.
  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  /// Converts a [NoteEntity] from the domain layer into a [NoteModel] for local storage.
  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      uid: entity.uid,
      title: entity.title,
      content: entity.contentJsonString,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      localId: entity.localId,
    );
  }
}

/// Extension to convert [NoteModel] back to a [NoteEntity].
extension NoteModelX on NoteModel {
  /// Converts the [NoteModel] into a [NoteEntity].
  NoteEntity toEntity() => NoteEntity.fromContentString(
    uid: uid,
    title: title,
    contentString: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
    localId: localId,
  );
}

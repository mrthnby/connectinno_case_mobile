import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

/// Represents the different events that can occur in the Home feature (notes list).
///
/// Uses `freezed` for union types and pattern matching.
@freezed
sealed class HomeEvent with _$HomeEvent {
  /// Event to fetch all notes from the repository or datasource.
  const factory HomeEvent.getNotes() = HomeGetNotesEvent;

  /// Event to create a new note.
  ///
  /// Contains the `NoteEntity` to be created.
  const factory HomeEvent.createNote(NoteEntity note) = HomeCreateNoteEvent;

  /// Event to update an existing note.
  ///
  /// Contains the `NoteEntity` with updated content.
  const factory HomeEvent.updateNote(NoteEntity note) = HomeUpdateNoteEvent;

  /// Event to delete a note.
  ///
  /// Contains the `NoteEntity` to be removed.
  const factory HomeEvent.deleteNote(NoteEntity note) = HomeDeleteNoteEvent;
}

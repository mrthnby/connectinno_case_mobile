import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

/// Abstract repository for managing notes.
///
/// Defines the contract for CRUD operations on notes.
/// Implementations will handle actual data sources, e.g., local database or remote API.
abstract class HomeRepository {
  /// Creates a new note.
  ///
  /// Returns an [Either] containing a [Failure] on error,
  /// or the created [NoteEntity] on success.
  Future<Either<Failure, NoteEntity>> createNote(NoteEntity note);

  /// Updates an existing note.
  ///
  /// Returns an [Either] containing a [Failure] on error,
  /// or `void` on success.
  Future<Either<Failure, void>> updateNote(NoteEntity note);

  /// Deletes an existing note.
  ///
  /// Returns an [Either] containing a [Failure] on error,
  /// or `void` on success.
  Future<Either<Failure, void>> deleteNote(NoteEntity note);

  /// Retrieves all notes.
  ///
  /// Returns an [Either] containing a [Failure] on error,
  /// or a list of [NoteEntity] on success.
  Future<Either<Failure, List<NoteEntity>>> getNotes();

  Future<Either<Failure, void>> syncNotes();  
}

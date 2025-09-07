import 'package:connectinno_case_mobile/core/clients/db/local_db_client.dart';
import 'package:connectinno_case_mobile/features/home/data/models/note_model.dart';
import 'package:injectable/injectable.dart';

/// Abstract class defining the contract for local database operations on notes.
abstract class HomeLocalDatasource {
  /// Creates a new note in the local database.
  ///
  /// Returns the generated local ID of the saved note.
  Future<int> createNote(NoteModel note);

  /// Updates an existing note in the local database.
  Future<void> updateNote(NoteModel note);

  /// Deletes a note from the local database.
  Future<void> deleteNote(NoteModel note);

  /// Retrieves all notes from the local database.
  Future<List<NoteModel>> getNotes();
}

/// Concrete implementation of [HomeLocalDatasource].
///
/// Uses `@LazySingleton` to provide a single instance across the app via `injectable`.
@LazySingleton(as: HomeLocalDatasource)
final class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  /// Constructs the local datasource with a [LocalDatabaseClient] instance.
  HomeLocalDatasourceImpl(this.localDatabaseClient);

  /// The local database client used to perform CRUD operations.
  final LocalDatabaseClient localDatabaseClient;

  /// Creates a new note in the local database and returns its local ID.
  @override
  Future<int> createNote(NoteModel note) async {
    return localDatabaseClient.save<NoteModel>(note);
  }

  /// Deletes a note from the local database.
  ///
  /// Throws an [Exception] if the note does not have a local ID.
  @override
  Future<void> deleteNote(NoteModel note) {
    if (note.localId == null) {
      throw Exception('Note has no local id');
    }
    return localDatabaseClient.delete<NoteModel>(note.localId!);
  }

  /// Retrieves all notes stored in the local database.
  @override
  Future<List<NoteModel>> getNotes() {
    return localDatabaseClient.getAll<NoteModel>();
  }

  /// Updates an existing note in the local database.
  ///
  /// Throws an [Exception] if the note does not have a local ID.
  @override
  Future<void> updateNote(NoteModel note) {
    if (note.localId == null) {
      throw Exception('Note has no local id');
    }
    return localDatabaseClient.save<NoteModel>(note);
  }
}

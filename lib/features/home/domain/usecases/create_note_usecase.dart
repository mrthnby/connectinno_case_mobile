import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case for creating a new note.
///
/// This class handles the business logic of creating a note
/// by delegating the operation to the [HomeRepository].
@injectable
final class CreateNoteUsecase {
  /// Constructs the use case with a required repository.
  CreateNoteUsecase(this.homeRepository);

  /// Repository responsible for note operations.
  final HomeRepository homeRepository;

  /// Executes the use case.
  ///
  /// Takes a [NoteEntity] to create.
  /// Returns an [Either] containing a [Failure] on error,
  /// or the created [NoteEntity] on success.
  Future<Either<Failure, NoteEntity>> call(NoteEntity note) async {
    return homeRepository.createNote(note);
  }
}

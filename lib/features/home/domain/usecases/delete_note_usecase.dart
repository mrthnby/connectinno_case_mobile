import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case for deleting a note.
///
/// This class handles the business logic of deleting a specific note
/// by delegating the operation to the [HomeRepository].
@injectable
final class DeleteNoteUsecase {
  /// Constructs the use case with a required repository.
  DeleteNoteUsecase(this.homeRepository);

  /// Repository responsible for note operations.
  final HomeRepository homeRepository;

  /// Executes the use case.
  ///
  /// Takes a [NoteEntity] to delete.
  /// Returns an [Either] containing a [Failure] on error,
  /// or `void` on successful deletion.
  Future<Either<Failure, void>> call(NoteEntity note) async {
    return homeRepository.deleteNote(note);
  }
}

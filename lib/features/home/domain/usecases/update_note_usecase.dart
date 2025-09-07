import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case for updating an existing note.
///
/// This class handles the business logic of updating a note
/// by delegating the operation to the `HomeRepository`.
@injectable
final class UpdateNoteUsecase {
  /// Constructs the use case with a required repository.
  UpdateNoteUsecase(this.homeRepository);

  /// Repository responsible for note operations.
  final HomeRepository homeRepository;

  /// Executes the use case.
  ///
  /// Takes a [NoteEntity] and attempts to update it in the repository.
  /// Returns an [Either] containing a [Failure] on error, or `void` on success.
  Future<Either<Failure, void>> call(NoteEntity note) async {
    return homeRepository.updateNote(note);
  }
}

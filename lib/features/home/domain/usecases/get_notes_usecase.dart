import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case for fetching all notes.
///
/// This class handles the business logic of retrieving notes
/// by delegating the operation to the [HomeRepository].
@injectable
final class GetNotesUsecase {
  /// Constructs the use case with a required repository.
  GetNotesUsecase(this.homeRepository);

  /// Repository responsible for note operations.
  final HomeRepository homeRepository;

  /// Executes the use case.
  ///
  /// Returns an [Either] containing a [Failure] on error,
  /// or a list of [NoteEntity] on success.
  Future<Either<Failure, List<NoteEntity>>> call() async {
    return homeRepository.getNotes();
  }
}

import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// A use case responsible for retrieving the current user's ID.
///
/// Returns:
/// - [Right] with the user ID ([String]) if found.
/// - [Right] with `null` if no user ID is stored.
/// - [Left] with a [Failure] if an error occurs.
@injectable
final class GetCurrentUserIDUsecase {
  /// Creates a new instance of the use case with the required [SplashRepository].
  GetCurrentUserIDUsecase(this.splashRepository);

  /// Repository that provides access to splash-related data.
  final SplashRepository splashRepository;

  /// Executes the use case.
  ///
  /// Calls [SplashRepository.getCurrentUserID] and returns:
  /// - Either.left with a [Failure] on error.
  /// - Either.right with a `String?` representing the user ID or `null`.
  Future<Either<Failure, String?>> call() =>
      splashRepository.getCurrentUserID();
}

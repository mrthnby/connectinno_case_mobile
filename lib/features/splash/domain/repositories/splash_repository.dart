import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:dartz/dartz.dart';

/// Repository contract for splash-related data operations.
///
/// Responsibilities:
/// - Defines how the app retrieves the currently stored user ID.
/// - Ensures the domain layer does not depend on implementation details
///   of data storage (e.g., SharedPreferences, secure storage, database).
abstract class SplashRepository {
  /// Retrieves the currently stored user ID.
  ///
  /// Returns:
  /// - [Right] with a [String] user ID if available.
  /// - [Right] with `null` if no user ID is found.
  /// - [Left] with a [Failure] if an error occurs (e.g., storage issue).
  Future<Either<Failure, String?>> getCurrentUserID();
}

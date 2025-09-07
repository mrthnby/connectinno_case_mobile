/// Custom exception for authentication-related errors.
final class AuthException implements Exception {
  /// Creates an [AuthException] with a descriptive error [message].
  AuthException({required this.message});

  /// The error message describing what went wrong.
  final String message;

  @override
  String toString() {
    return message;
  }
}

/// Custom exception for local database-related errors.
final class LocalDatabaseException implements Exception {
  /// Creates a [LocalDatabaseException] with a descriptive error [message].
  LocalDatabaseException({required this.message});

  /// The error message describing what went wrong with the local database operation.
  final String message;

  @override
  String toString() {
    return message;
  }
}

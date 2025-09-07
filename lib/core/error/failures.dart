/// Base class representing a failure in the application.
///
/// Used throughout the app to standardize error handling in a
/// functional way (e.g., with `Either<Failure, T>` from dartz).
/// Contains a [message] describing the error.
abstract class Failure {
  /// Creates a [Failure] with a descriptive [message].
  const Failure({required this.message});

  /// Human-readable description of the failure.
  final String message;
}

/// Represents a validation failure.
///
/// Specifically for invalid input data (e.g., empty fields,
/// incorrect format, etc.). Contains a [message] describing the
/// specific validation issue.
final class ValidationFailure extends Failure {
  /// Creates a [ValidationFailure] with the given [message].
  const ValidationFailure({required super.message});
}

/// Represents an unknown or unexpected failure.
///
/// Can be used as a fallback for errors that don't have a
/// more specific failure type.
final class UnknownFailure extends Failure {
  /// Creates an [UnknownFailure] with the given [message].
  const UnknownFailure({required super.message});
}

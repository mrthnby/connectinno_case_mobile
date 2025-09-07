import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:dartz/dartz.dart';

/// Abstract repository for handling authentication-related operations.
///
/// This defines the contract that any concrete implementation (e.g., Firebase, API)
/// must fulfill. All methods return an [Either<Failure, T>] to handle errors
/// functionally and ensure type safety.
abstract class AuthRepository {
  /// Logs in a user with the given [email] and [password].
  ///
  /// Returns:
  /// - `Right<String>` with the user ID (UID) on success.
  /// - `Left<Failure>` if login fails (e.g., invalid credentials, network error).
  Future<Either<Failure, String>> login(String email, String password);

  /// Registers a new user with [email], [password], and [name].
  ///
  /// Returns:
  /// - `Right<String>` with the user ID (UID) on successful registration.
  /// - `Left<Failure>` if registration fails (e.g., email already in use, network error).
  Future<Either<Failure, String>> register(
    String email,
    String password,
    String name,
  );

  /// Sends a password reset link to the provided [email].
  ///
  /// Returns:
  /// - `Right<void>` if the reset link is sent successfully.
  /// - `Left<Failure>` if sending fails (e.g., invalid email, network error).
  Future<Either<Failure, void>> sendResetLink(String email);
}

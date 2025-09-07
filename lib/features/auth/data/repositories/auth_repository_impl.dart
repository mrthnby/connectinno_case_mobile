import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:connectinno_case_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Concrete implementation of [AuthRepository] that communicates with a remote data source.
///
/// Handles authentication operations such as login, registration, and password reset
/// by delegating to [AuthRemoteDatasource]. Errors are caught and wrapped in [Failure].
///
/// Example usage via service locator:
/// ```dart
/// final authRepo = sl<AuthRepository>();
///
/// // Login
/// final loginResult = await authRepo.login('user@example.com', 'password123');
/// loginResult.fold(
///   (failure) => print('Login failed: ${failure.message}'),
///   (uid) => print('Logged in successfully, UID: $uid'),
/// );
/// ```
@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  /// Constructs the repository with a remote data source.
  AuthRepositoryImpl(this.authRemoteDatasource);

  /// Remote data source that actually performs API calls.
  final AuthRemoteDatasource authRemoteDatasource;

  /// Logs in a user using the remote data source.
  ///
  /// Returns:
  /// - `Right<String>` containing the user ID on success.
  /// - `Left<Failure>` on failure (catches all exceptions as [UnknownFailure]).
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final result = await authRemoteDatasource.login(email, password);
      return Right(result);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  /// Registers a new user using the remote data source.
  ///
  /// Returns:
  /// - `Right<String>` containing the user ID on success.
  /// - `Left<Failure>` on failure (catches all exceptions as [UnknownFailure]).
  @override
  Future<Either<Failure, String>> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final result = await authRemoteDatasource.register(email, password, name);
      return Right(result);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  /// Sends a password reset link using the remote data source.
  ///
  /// Returns:
  /// - `Right<void>` on success.
  /// - `Left<Failure>` on failure (catches all exceptions as [UnknownFailure]).
  @override
  Future<Either<Failure, void>> sendResetLink(String email) async {
    try {
      final result = await authRemoteDatasource.sendResetLink(email);
      return Right(result);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

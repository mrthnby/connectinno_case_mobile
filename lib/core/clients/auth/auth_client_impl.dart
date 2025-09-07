import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart';
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
import 'package:connectinno_case_mobile/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [AuthClient] using Firebase Authentication.
///
/// Responsibilities:
/// - Provides user authentication methods (login, register, logout, password reset).
/// - Retrieves the current authenticated user ID.
/// - Logs warnings and errors using [LoggerService] for debugging and monitoring.
/// - Ensures proper handling of Firebase exceptions and unexpected errors.
@LazySingleton(as: AuthClient)
final class AuthClientImpl implements AuthClient {
  /// Creates an [AuthClientImpl] with the required Firebase and logger instances.
  AuthClientImpl(this._firebaseAuth, this._logger);

  final FirebaseAuth _firebaseAuth;
  final LoggerService _logger;

  /// Returns the currently authenticated user's UID, or `null` if none exists.
  @override
  Future<String?> currentUserID() async {
    try {
      final user = _firebaseAuth.currentUser;
      _logger.info(
        'Current user id',
        data: {'user_id': user?.uid},
      );
      return user?.uid;
    } catch (error, stackTrace) {
      _logger.error(
        'Failed to get current user id',
        error: error,
        stackTrace: stackTrace,
      );
      throw AuthException(message: error.toString());
    }
  }

  /// Authenticates a user with email and password.
  ///
  /// Returns the user UID if successful, or `null` if authentication fails.
  @override
  Future<String> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null || credential.user?.uid == null) {
        throw AuthException(message: 'Login failed');
      }

      return credential.user!.uid;
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Login failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'email': email,
          'code': error.code,
          'message': error.message,
        },
      );
      throw AuthException(message: error.message ?? 'Login failed');
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during login',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email},
      );
      throw AuthException(message: error.toString());
    }
  }

  /// Logs out the currently authenticated user.
  ///
  /// Throws an exception if unsuccessful.
  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Logout failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'code': error.code,
          'message': error.message,
        },
      );
      throw AuthException(message: error.message ?? 'Logout failed');
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during logout',
        error: error,
        stackTrace: stackTrace,
      );
      throw AuthException(message: error.toString());
    }
  }

  /// Registers a new user with email, password, and name.
  ///
  /// Returns the user UID if successful, or `null` if registration fails.
  @override
  Future<String> register(String email, String password, String name) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && name.isNotEmpty) {
        // Update the user's display name if provided
        await credential.user!.updateDisplayName(name);
      }

      if (credential.user == null || credential.user?.uid == null) {
        throw AuthException(message: 'Registration failed');
      }

      return credential.user!.uid;
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Registration failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'email': email,
          'name': name,
          'code': error.code,
          'message': error.message,
        },
      );
      throw AuthException(message: error.message ?? 'Registration failed');
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during registration',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email, 'name': name},
      );
      throw AuthException(message: error.toString());
    }
  }

  /// Resets the user's password by sending a reset email.
  ///
  /// Firebase does not support direct password reset without an OOB code.
  /// Throws an exception if unsuccessful.
  @override
  Future<void> sendResetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Send reset password request failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'email': email,
          'code': error.code,
          'message': error.message,
        },
      );
      throw AuthException(
        message: error.message ?? 'Send reset password request failed',
      );
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during send reset password request',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email},
      );
      throw AuthException(message: error.toString());
    }
  }
}

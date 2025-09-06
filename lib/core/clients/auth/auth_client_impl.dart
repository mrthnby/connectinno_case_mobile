import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart';
import 'package:connectinno_case_mobile/core/clients/logger/logger_service.dart';
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
      return user?.uid;
    } catch (error, stackTrace) {
      _logger.error(
        'Failed to get current user id',
        error: error,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  /// Authenticates a user with email and password.
  ///
  /// Returns the user UID if successful, or `null` if authentication fails.
  @override
  Future<String?> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
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
      return null;
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during login',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email},
      );
      return null;
    }
  }

  /// Sends a password reset email to the given [email].
  ///
  /// Returns `true` if the email was successfully sent, `false` otherwise.
  @override
  Future<bool> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Forgot password failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'email': email,
          'code': error.code,
          'message': error.message,
        },
      );
      return false;
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during forgot password',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email},
      );
      return false;
    }
  }

  /// Logs out the currently authenticated user.
  ///
  /// Returns `true` if successful, `false` otherwise.
  @override
  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
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
      return false;
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during logout',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Registers a new user with email, password, and name.
  ///
  /// Returns the user UID if successful, or `null` if registration fails.
  @override
  Future<String?> register(String email, String password, String name) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && name.isNotEmpty) {
        // Update the user's display name if provided
        await credential.user!.updateDisplayName(name);
      }

      return credential.user?.uid;
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
      return null;
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during registration',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email, 'name': name},
      );
      return null;
    }
  }

  /// Resets the user's password by sending a reset email.
  ///
  /// Firebase does not support direct password reset without an OOB code.
  /// Returns `true` if the reset email was sent, `false` otherwise.
  @override
  Future<bool> resetPassword(String email, String password) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.warning(
        'Reset password request failed',
        error: error,
        stackTrace: stackTrace,
        data: {
          'email': email,
          'code': error.code,
          'message': error.message,
        },
      );
      return false;
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during reset password request',
        error: error,
        stackTrace: stackTrace,
        data: {'email': email},
      );
      return false;
    }
  }
}

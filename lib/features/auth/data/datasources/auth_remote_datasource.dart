import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart';
import 'package:injectable/injectable.dart';

/// Abstract datasource for authentication operations that interact with remote APIs.
///
/// Defines the contract for login, registration, and password reset operations.
/// Implementations should communicate with a remote service (e.g., REST API, Firebase).
abstract class AuthRemoteDatasource {
  /// Logs in a user with [email] and [password].
  /// Returns a [String] representing the user ID (UID) on success.
  Future<String> login(String email, String password);

  /// Registers a new user with [email], [password], and [name].
  /// Returns a [String] representing the user ID (UID) on success.
  Future<String> register(String email, String password, String name);

  /// Sends a password reset link to [email].
  /// Returns [void] on success.
  Future<void> sendResetLink(String email);
}

/// Concrete implementation of [AuthRemoteDatasource] that uses [AuthClient] to perform API calls.
///
/// Example usage via service locator:
/// ```dart
/// final authRemote = sl<AuthRemoteDatasource>();
///
/// // Login
/// final uid = await authRemote.login('user@example.com', 'password123');
/// print('Logged in UID: $uid');
/// ```
@LazySingleton(as: AuthRemoteDatasource)
final class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  /// Constructs the remote datasource with [AuthClient].
  AuthRemoteDatasourceImpl(this.authClient);

  /// Client that handles the actual HTTP/API calls.
  final AuthClient authClient;

  @override
  Future<String> login(String email, String password) {
    return authClient.login(email, password);
  }

  @override
  Future<String> register(String email, String password, String name) {
    return authClient.register(email, password, name);
  }

  @override
  Future<void> sendResetLink(String email) {
    return authClient.sendResetPassword(email);
  }
}

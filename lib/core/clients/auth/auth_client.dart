/// Abstract class representing the contract for authentication operations.
///
/// This class defines all the methods that any authentication client
/// (e.g., FirebaseAuth, SupabaseAuth) must implement.
/// The purpose of using an abstract class is to **decouple your application
/// from third-party authentication providers** and allow easy swapping
/// of implementations in the future.
abstract class AuthClient {
  /// Returns the currently logged-in user's unique identifier (uid).
  ///
  /// Returns `null` if no user is logged in.
  Future<String?> currentUserID();

  /// Logs in a user with the provided [email] and [password].
  ///
  /// Returns the user's unique identifier (uid) upon successful login,
  /// or `null` if login fails.
  Future<String?> login(String email, String password);

  /// Logs out the currently authenticated user.
  ///
  /// Returns `true` if logout was successful, `false` otherwise.
  Future<bool> logout();

  /// Registers a new user with [email], [password], and [name].
  ///
  /// Returns the user's unique identifier (uid) upon successful registration,
  /// or `null` if registration fails.
  Future<String?> register(
    String email,
    String password,
    String name,
  );

  /// Sends a password reset email to the given [email].
  ///
  /// Returns `true` if the email was successfully sent, `false` otherwise.
  Future<bool> forgotPassword(String email);

  /// Resets the user's password for the given [email] to [password].
  ///
  /// Returns `true` if the password reset mail was successfully sent, `false` otherwise.
  Future<bool> resetPassword(String email, String password);
}

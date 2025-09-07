/// Abstract class representing the contract for authentication operations.
///
/// This class defines all the methods that any authentication client
/// (e.g., FirebaseAuth, SupabaseAuth) must implement.
/// The purpose of using an abstract class is to **decouple your application
/// from third-party authentication providers** and allow easy swapping
/// of implementations in the future.
abstract class AuthClient {

  /// Returns the token of the currently logged-in user.
  ///
  /// Returns `null` if no user is logged in.
  Future<String?> getToken();

  /// Returns the currently logged-in user's unique identifier (uid).
  ///
  /// Returns `null` if no user is logged in.
  Future<String?> currentUserID();

  /// Logs in a user with the provided [email] and [password].
  ///
  /// Returns the user's unique identifier (uid) upon successful login,
  Future<String> login(String email, String password);

  /// Logs out the currently authenticated user.
  ///
  /// Returns `true` if logout was successful, throws an exception otherwise.
  Future<void> logout();

  /// Registers a new user with [email], [password], and [name].
  ///
  /// Returns the user's unique identifier (uid) upon successful registration,
  Future<String> register(
    String email,
    String password,
    String name,
  );

  /// Sends a password reset email to the given [email].
  ///
  /// Returns `true` if the password reset mail was successfully sent, throws an exception otherwise.
  Future<void> sendResetPassword(String email);
}

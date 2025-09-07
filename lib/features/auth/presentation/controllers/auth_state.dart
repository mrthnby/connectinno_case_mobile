import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// Represents the different states of authentication in the app.
///
/// This is used in a Bloc/Cubit to handle authentication flows.
/// Using `freezed` allows for sealed classes (union types) and
/// pattern matching with `when` or `map`.
///
/// Example usage:
/// ```dart
/// authState.when(
///   initial: () => print("Auth not started"),
///   loading: () => print("Logging in..."),
///   successfullyLoggedIn: () => print("User logged in"),
///   resetPasswordSent: () => print("Reset email sent"),
///   error: (message) => print("Error: $message"),
/// );
/// ```
@freezed
abstract class AuthState with _$AuthState {
  /// Initial state before any authentication action has started.
  const factory AuthState.initial() = AuthInitialState;

  /// State when an authentication process is in progress (e.g., logging in or signing up).
  const factory AuthState.loading() = AuthLoadingState;

  /// State when a user has successfully logged in.
  const factory AuthState.successfullyLoggedIn() =
      AuthSuccessfullyLoggedInState;

  /// State when a password reset email has been sent successfully.
  const factory AuthState.resetPasswordSent() = AuthResetPasswordSentState;

  /// State when an error occurs during authentication.
  ///
  /// [message] provides details about the error.
  const factory AuthState.error({required String message}) = AuthErrorState;
}

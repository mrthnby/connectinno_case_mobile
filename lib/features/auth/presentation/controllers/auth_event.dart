import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// Represents all possible authentication events in the app.
///
/// This is typically used with a Bloc/Cubit to trigger different
/// authentication actions.
@freezed
abstract class AuthEvent with _$AuthEvent {
  /// Event triggered to log in a user.
  ///
  /// Requires:
  /// - [email]: The user's email.
  /// - [password]: The user's password.
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = AuthLoginEvent;

  /// Event triggered to register a new user.
  ///
  /// Requires:
  /// - [email]: The user's email.
  /// - [password]: The user's password.
  /// - [name]: The user's full name.
  /// - [confirmPassword]: Password confirmation for validation.
  const factory AuthEvent.register({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) = AuthRegisterEvent;

  /// Event triggered to send a password reset link to the user's email.
  ///
  /// Requires:
  /// - [email]: The user's email to send the reset link to.
  const factory AuthEvent.sendResetLink({required String email}) =
      AuthSendResetLinkEvent;
}

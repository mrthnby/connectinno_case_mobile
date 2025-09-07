import 'package:connectinno_case_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:connectinno_case_mobile/features/auth/domain/usecases/register_usecase.dart';
import 'package:connectinno_case_mobile/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_event.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Bloc that manages authentication logic.
///
/// Listens to [AuthEvent]s and emits [AuthState]s based on the
/// result of domain use cases.
///
/// Example usage with `injectable` and `get_it`:
/// ```dart
/// // In a widget
/// BlocProvider(
///   create: (context) => sl<AuthBloc>(),
///   child: AuthScreen(),
/// )
/// ```
@injectable
final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Creates an AuthBloc with the given use cases.
  ///
  /// [loginUsecase], [registerUsecase], and [sendResetLinkUsecase] are
  /// required domain logic handlers injected via `injectable`.
  AuthBloc(
    this.loginUsecase,
    this.registerUsecase,
    this.sendResetLinkUsecase,
  ) : super(const AuthInitialState()) {
    on<AuthLoginEvent>(_onAuthLoginEvent);
    on<AuthRegisterEvent>(_onAuthRegisterEvent);
    on<AuthSendResetLinkEvent>(_onAuthSendResetLinkEvent);
  }

  /// Handles login logic.
  final LoginUsecase loginUsecase;

  /// Handles registration logic.
  final RegisterUsecase registerUsecase;

  /// Handles sending reset password links.
  final ResetPasswordUsecase sendResetLinkUsecase;

  /// Login event.
  Future<void> _onAuthLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());

    final result = await loginUsecase.call(event.email, event.password);

    result.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (success) => emit(const AuthSuccessfullyLoggedInState()),
    );
  }

  /// Register event.
  Future<void> _onAuthRegisterEvent(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());

    final result = await registerUsecase.call(
      email: event.email,
      password: event.password,
      name: event.name,
      confirmPassword: event.confirmPassword,
    );

    result.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (success) => emit(const AuthSuccessfullyLoggedInState()),
    );
  }

  /// Send reset link event.
  Future<void> _onAuthSendResetLinkEvent(
    AuthSendResetLinkEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());

    final result = await sendResetLinkUsecase.call(event.email);

    result.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (success) => emit(const AuthResetPasswordSentState()),
    );
  }
}

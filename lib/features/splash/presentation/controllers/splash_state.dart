import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

/// Represents all possible states of the SplashBloc.
///
@freezed
sealed class SplashState with _$SplashState {
  /// The initial state before any event has been processed.
  const factory SplashState.initial() = SplashInitialState;

  /// Indicates that a user ID was successfully found.
  ///
  /// This state is followed by a navigation to the Home page.
  const factory SplashState.userIDFound({required String userID}) =
      SplashUserIDFoundState;

  /// Indicates that no user ID was found.
  ///
  /// This state triggers navigation to the Login page.
  const factory SplashState.userIDNotFound() = SplashUserIDNotFoundState;

  /// Represents an error during splash logic.
  ///
  /// [message] contains a description of the error.
  const factory SplashState.error({required String message}) = SplashErrorState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

/// Defines all possible events that can be dispatched to the SplashBloc.
///
@freezed
sealed class SplashEvent with _$SplashEvent {
  /// Triggered when the splash screen is shown.
  ///
  /// This event starts the initialization process,
  /// such as checking if a stored user ID exists.
  const factory SplashEvent.initialize() = SplashInitializeEvent;
}

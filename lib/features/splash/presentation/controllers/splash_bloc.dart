import 'package:connectinno_case_mobile/features/splash/domain/usecases/get_current_user_id_usecase.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_event.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// [SplashBloc] handles the initialization logic of the splash screen.
///
/// Responsibilities:
/// - Listens to [SplashEvent]s and updates the [SplashState] accordingly.
/// - On initialization, checks if a user ID exists via [GetCurrentUserIDUsecase].
/// - Emits:
///   - [SplashUserIDFoundState] when a user ID is found.
///   - [SplashUserIDNotFoundState] when no user ID exists.
///   - [SplashErrorState] if an error occurs.
@injectable
final class SplashBloc extends Bloc<SplashEvent, SplashState> {
  /// Creates a [SplashBloc] with the required [GetCurrentUserIDUsecase].
  ///
  /// The bloc starts in [SplashInitialState] and listens
  /// for [SplashInitializeEvent].
  SplashBloc(this.getCurrentUserIDUsecase) : super(const SplashInitialState()) {
    on<SplashInitializeEvent>(_onInitialize);
  }

  /// Use case to retrieve the currently stored user ID (if any).
  final GetCurrentUserIDUsecase getCurrentUserIDUsecase;

  /// Handles the [SplashInitializeEvent].
  ///
  /// - Calls [getCurrentUserIDUsecase] to fetch the stored user ID.
  /// - Emits:
  ///   - [SplashErrorState] if the use case fails.
  ///   - [SplashUserIDNotFoundState] if no user ID is found.
  ///   - [SplashUserIDFoundState] if a user ID is found.
  Future<void> _onInitialize(
    SplashInitializeEvent event,
    Emitter<SplashState> emit,
  ) async {
    final result = await getCurrentUserIDUsecase();

    result.fold(
      // On failure, emit error state with message
      (failure) => emit(SplashErrorState(message: failure.message)),

      // On success, check if user ID exists
      (uid) {
        if (uid == null) {
          emit(const SplashUserIDNotFoundState());
        } else {
          emit(SplashUserIDFoundState(userID: uid));
        }
      },
    );
  }
}

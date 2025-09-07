import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

/// Represents the different states of the Home feature (notes list).
///
/// Uses `freezed` for union types and pattern matching.
@freezed
sealed class HomeState with _$HomeState {
  /// Initial state before any action is taken.
  const factory HomeState.initial() = HomeInitialState;

  /// State when data (notes) is being loaded.
  const factory HomeState.loading() = HomeLoadingState;

  /// State when notes have been successfully loaded.
  ///
  /// Contains the list of loaded notes.
  const factory HomeState.loaded({required List<NoteEntity> notes}) =
      HomeLoadedState;

  /// State when an error occurs.
  ///
  /// Contains an error message describing the issue.
  const factory HomeState.error({required String message}) = HomeErrorState;
}

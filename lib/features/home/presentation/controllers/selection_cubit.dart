import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the selection state of notes in the UI.
///
/// Tracks whether selection mode is active and which notes are selected.
final class SelectionState {
  /// Creates a selection state.
  const SelectionState({
    required this.isSelectionMode,
    required this.selectedNoteIds,
  });

  /// Whether the selection mode is currently active.
  final bool isSelectionMode;

  /// The set of selected note IDs.
  final Set<String> selectedNoteIds;

  /// Returns the number of selected notes.
  int get selectedCount => selectedNoteIds.length;

  /// Returns true if any note is selected.
  bool get hasSelection => selectedNoteIds.isNotEmpty;

  /// Checks if a given note ID is selected.
  bool isSelected(String noteId) => selectedNoteIds.contains(noteId);

  /// Returns a copy of this state with optional overrides.
  SelectionState copyWith({
    bool? isSelectionMode,
    Set<String>? selectedNoteIds,
  }) => SelectionState(
    isSelectionMode: isSelectionMode ?? this.isSelectionMode,
    selectedNoteIds: selectedNoteIds ?? this.selectedNoteIds,
  );

  /// The initial state with selection mode off and no selected notes.
  static const initial = SelectionState(
    isSelectionMode: false,
    selectedNoteIds: <String>{},
  );
}

/// Cubit that manages the selection state for notes.
///
/// Provides methods to enter/exit selection mode, select/deselect notes,
/// and manipulate the current selection set.
final class SelectionCubit extends Cubit<SelectionState> {
  /// Initializes the cubit with the initial selection state.
  SelectionCubit() : super(SelectionState.initial);


  /// Exits selection mode and clears the selection.
  void exitSelectionMode() {
    emit(SelectionState.initial);
  }

  /// Enters selection mode optionally with a first selected note ID.
  void enterSelectionMode({String? firstSelectedId}) {
    final updated = <String>{...state.selectedNoteIds};
    if (firstSelectedId != null) {
      updated.add(firstSelectedId);
    }
    emit(SelectionState(isSelectionMode: true, selectedNoteIds: updated));
  }

  /// Toggles the selection status of a specific note.
  void toggleSelect(String noteId) {
    final updated = <String>{...state.selectedNoteIds};
    if (updated.remove(noteId) == false) {
      updated.add(noteId);
    }
    emit(state.copyWith(selectedNoteIds: updated));
  }
}

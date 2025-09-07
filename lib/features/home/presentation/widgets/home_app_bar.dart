import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_bloc.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_event.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_state.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom AppBar for the home screen displaying notes.
///
/// Supports normal mode and selection mode for multi-note operations.
class HomeAppBar extends StatelessWidget {
  /// Default constructor for `HomeAppBar`.
  const HomeAppBar({super.key});

  /// Deletes selected notes after confirming with the user.
  ///
  /// Shows an alert dialog asking for confirmation, then dispatches delete events
  /// for each selected note through the `HomeBloc`. Finally, exits selection mode.
  Future<void> _deleteSelectedNotes(
    BuildContext context,
    SelectionState selectionState,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete notes?'),
        content: Text(
          'Are you sure you want to delete ${selectionState.selectedCount} selected note(s)?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    if (!context.mounted) return;
    final homeState = context.read<HomeBloc>().state;
    final notes = homeState.maybeWhen(
      loaded: (n) => n,
      orElse: () => <NoteEntity>[],
    );

    final selectedIds = selectionState.selectedNoteIds;
    for (final note in notes) {
      if (selectedIds.contains(note.uid)) {
        context.read<HomeBloc>().add(HomeEvent.deleteNote(note));
      }
    }

    context.read<SelectionCubit>().exitSelectionMode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, selectionState) {
        return AppBar(
          centerTitle: true,
          title: Text(
            selectionState.isSelectionMode && selectionState.selectedCount > 0
                ? '${selectionState.selectedCount} selected'
                : 'Notes',
          ),
          leading: selectionState.isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      context.read<SelectionCubit>().exitSelectionMode(),
                  tooltip: 'Cancel',
                )
              : null,
          actions: [
            if (selectionState.isSelectionMode)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: selectionState.selectedCount == 0
                    ? null
                    : () => _deleteSelectedNotes(context, selectionState),
                tooltip: 'Delete',
              )
            else
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () =>
                    context.read<SelectionCubit>().enterSelectionMode(),
                tooltip: 'Edit',
              ),
          ],
        );
      },
    );
  }
}

import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_bloc.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_event.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/home_state.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
        title: Text(LocaleKeys.deleteNotesQuestion.tr()),
        content: Text(
          LocaleKeys.confirmDeleteSelected.tr(
            namedArgs: {'count': selectionState.selectedCount.toString()},
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(LocaleKeys.delete.tr()),
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
                ? LocaleKeys.selectedCount.tr(
                    namedArgs: {
                      'count': selectionState.selectedCount.toString(),
                    },
                  )
                : LocaleKeys.notes.tr(),
          ),
          leading: selectionState.isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      context.read<SelectionCubit>().exitSelectionMode(),
                  tooltip: LocaleKeys.cancel.tr(),
                )
              : null,
          actions: [
            if (selectionState.isSelectionMode)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: selectionState.selectedCount == 0
                    ? null
                    : () => _deleteSelectedNotes(context, selectionState),
                tooltip: LocaleKeys.delete.tr(),
              )
            else
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () =>
                    context.read<SelectionCubit>().enterSelectionMode(),
                tooltip: LocaleKeys.edit.tr(),
              ),
          ],
        );
      },
    );
  }
}

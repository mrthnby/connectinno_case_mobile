import 'package:connectinno_case_mobile/core/router/routes.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:connectinno_case_mobile/features/home/presentation/controllers/selection_cubit.dart';
import 'package:connectinno_case_mobile/features/home/presentation/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// A grid widget that displays a list of notes using `NoteCard` widgets.
///
/// Handles both normal tap and long-press interactions for selection mode.
class NotesGrid extends StatelessWidget {
  /// Constructor requires a list of `NoteEntity` objects to display.
  const NotesGrid({required this.notes, super.key});

  /// The list of notes to be displayed in the grid.
  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160,
          crossAxisSpacing: AppDimens.s16,
        );

        return GridView.builder(
          gridDelegate: gridDelegate,
          itemCount: notes.length,
          padding: const EdgeInsets.only(bottom: AppDimens.s24),
          itemBuilder: (context, index) {
            final note = notes[index];

            final selectionState = context.watch<SelectionCubit>().state;
            final isSelected = selectionState.isSelected(note.uid);

            return NoteCard(
              note: note,
              isSelected: isSelected,

              onTap: () {
                final selectionCubit = context.read<SelectionCubit>();

                if (selectionCubit.state.isSelectionMode) {
                  selectionCubit.toggleSelect(note.uid);
                } else {
                  context.push(
                    NoteEditorPageRoute().location,
                    extra: note,
                  );
                }
              },

              onLongPress: () {
                final selectionCubit = context.read<SelectionCubit>();

                if (!selectionCubit.state.isSelectionMode) {
                  selectionCubit.enterSelectionMode(firstSelectedId: note.uid);
                } else {
                  selectionCubit.toggleSelect(note.uid);
                }
              },
            );
          },
        );
      },
    );
  }
}

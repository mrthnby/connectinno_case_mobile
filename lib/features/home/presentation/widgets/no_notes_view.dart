import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';

/// A widget displayed when there are no notes to show.
///
/// It shows a centered icon and messages prompting the user to add their first note.
class NoNotesView extends StatelessWidget {
  /// Default constructor for `NoNotesView`.
  const NoNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sticky_note_2_outlined,
            size: AppDimens.s64,
            color: context.colors.primary38,
          ),
          AppDimens.h12,
          Text('No notes yet'),
          AppDimens.h4,
          Text(
            'Tap + to add your first note',
          ),
        ],
      ),
    );
  }
}

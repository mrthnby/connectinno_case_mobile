import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
          Text(LocaleKeys.noNotesYet.tr()),
          AppDimens.h4,
          Text(
            LocaleKeys.tapToAddFirstNote.tr(),
          ),
        ],
      ),
    );
  }
}

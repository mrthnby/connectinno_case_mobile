import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:connectinno_case_mobile/features/home/domain/entities/note_entity.dart';
import 'package:flutter/material.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// A card widget that displays a single note with title, content preview,
/// last updated date, and selection state.
///
/// Supports tap and long-press interactions for navigation or selection.
class NoteCard extends StatelessWidget {
  /// Constructor for `NoteCard`.
  ///
  /// [note] is the note entity to display.
  /// [onTap] is called when the card is tapped.
  /// [onLongPress] is called when the card is long-pressed.
  /// [isSelected] indicates whether the card is currently selected.
  const NoteCard({
    required this.note,
    super.key,
    this.onTap,
    this.onLongPress,
    this.isSelected = false,
  });

  /// The note entity to display.
  final NoteEntity note;

  /// The callback to be called when the card is tapped.
  final VoidCallback? onTap;

  /// The callback to be called when the card is long-pressed.
  final VoidCallback? onLongPress;

  /// Whether the card is currently selected.
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final preview = _extractPreviewText(note);

    final borderColor = isSelected
        ? context.colors.primary
        : context.colors.primary12;
    final borderWidth = isSelected ? 2.0 : 1.0;

    return Material(
      color: context.colors.background,
      borderRadius: BorderRadius.circular(AppDimens.s12),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(AppDimens.s12),
        child: Ink(
          decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(AppDimens.s12),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: [
              BoxShadow(
                color: context.colors.primary12,
                blurRadius: AppDimens.s8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppDimens.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title.isEmpty ? LocaleKeys.untitled.tr() : note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.headline.copyWith(fontSize: 18),
                  ),
                  AppDimens.h8,
                  Text(
                    preview.isEmpty ? LocaleKeys.noContent.tr() : preview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.primary54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: AppDimens.s14,
                    color: context.colors.primary38,
                  ),
                  AppDimens.w8,
                  Text(
                    _formatDate(note.updatedAt),
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.primary54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Formats the [DateTime] for display.
  ///
  /// If the note was updated today, it shows `HH:mm`, otherwise `dd.MM.yyyy`.
  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }
    return '${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year}';
  }

  /// Extracts a text preview from the note content.
  ///
  /// Reads up to [maxChars] characters from the note's content operations.
  /// Converts newlines to spaces and trims the result.
  String _extractPreviewText(NoteEntity note, {int maxChars = 140}) {
    final buffer = StringBuffer();
    for (final op in note.content.toList()) {
      final data = op.data;
      if (op.isInsert && data is String) {
        buffer.write(data);
        if (buffer.length >= maxChars) break;
      }
    }
    final text = buffer.toString().replaceAll('\n', ' ').trim();
    return text.length > maxChars ? text.substring(0, maxChars) : text;
  }
}

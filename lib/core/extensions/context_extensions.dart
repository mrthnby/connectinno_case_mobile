import 'package:connectinno_case_mobile/core/theme/app_colors.dart';
import 'package:connectinno_case_mobile/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

/// Extension on [BuildContext] to easily access app colors and text styles.
///
/// This allows you to use the app's theme extensions directly from any widget
/// without repeatedly calling `Theme.of(context).extension<T>()`.
///
/// Example usage:
/// ```dart
/// final colors = context.colors;
/// final textStyle = context.textStyles.headline;
///
/// Container(
///   color: colors.background,
///   child: Text('Hello World', style: textStyle),
/// );
/// ```
extension ThemeExtension on BuildContext {
  /// Returns the app's color palette defined in [AppColorsExtension].
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  /// Returns the app's text styles defined in [AppTextStylesExtension].
  AppTextStylesExtension get textStyles =>
      Theme.of(this).extension<AppTextStylesExtension>()!;
}

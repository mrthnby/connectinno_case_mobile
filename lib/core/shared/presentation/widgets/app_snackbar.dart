import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:connectinno_case_mobile/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

//TODO: use theme colors

/// Enum to indicate the type of the SnackBar.
///
/// It affects the background color and the icon displayed:
enum SnackBarType {
  /// - `success`: For success messages.
  success,

  /// - `error`: For error messages.
  error,

  /// - `info`: For informational messages.
  info,
}

/// A utility class to display customized floating SnackBars.
///
/// This class provides a static method `show` to easily display a SnackBar
/// with an icon, color, and duration based on the [SnackBarType].
///
/// Features:
/// - Floating SnackBar with rounded corners and border.
/// - Customizable duration.
/// - Icon based on the type (`success`, `error`, `info`).
/// - Automatically hides any existing SnackBar before showing a new one.
///
/// Example usage:
/// ```dart
/// AppSnackBar.show(context, "Saved successfully!", type: SnackBarType.success);
/// AppSnackBar.show(context, "An error occurred!", type: SnackBarType.error);
/// AppSnackBar.show(context, "Here is some info", type: SnackBarType.info, duration: Duration(seconds: 5));
/// ```
final class AppSnackBar {
  /// Shows a floating SnackBar with the given [message] and optional [type] and [duration].
  ///
  /// [context] is the `BuildContext` where the SnackBar will be displayed.
  /// [message] is the text to be displayed in the SnackBar.
  /// [type] determines the color and icon of the SnackBar. Defaults to `SnackBarType.info`.
  /// [duration] specifies how long the SnackBar should be visible. Defaults to 3 seconds.
  static void show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    Icon icon;

    // Set background color and icon based on the SnackBar type
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        icon = const Icon(Icons.check_circle, color: Colors.white);
      case SnackBarType.error:
        backgroundColor = Colors.red.shade400;
        icon = const Icon(Icons.warning_rounded, color: Colors.white);
      case SnackBarType.info:
        backgroundColor = Colors.blue;
        icon = const Icon(Icons.info_rounded, color: Colors.white);
    }

    // Hide any currently visible SnackBar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the new SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: AppDimens.defaultPagePadding,
        elevation: 3,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        duration: duration,
        content: Row(
          children: [
            icon,
            AppDimens.w8,
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.smallLink.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

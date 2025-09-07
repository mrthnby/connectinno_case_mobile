import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A reusable elevated button with built-in loading state and themable styling.
class AppElevatedButton extends StatelessWidget {
  /// Creates a new instance of [AppElevatedButton].
  const AppElevatedButton({
    required this.text,
    this.isFullWidth = true,
    this.borderRadius = AppDimens.s24,
    this.textStyle,
    this.padding,
    this.onPressed,
    this.isLoading = false,
    super.key,
  });

  /// The button label text.
  final String text;

  /// Border radius for button corners.
  final double borderRadius;

  /// If true, button expands to full width.
  final bool isFullWidth;

  /// Text style for the button label. Defaults to theme's button style.
  final TextStyle? textStyle;

  /// Optional padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// Callback triggered when the button is pressed.
  final void Function()? onPressed;

  /// When true, disables the button and shows a loading indicator.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: isFullWidth
            ? const Size(double.infinity, AppDimens.s64)
            : null,
      ),
      child: isLoading
          ? SizedBox(
              width: AppDimens.s24,
              height: AppDimens.s24,
              child: CupertinoActivityIndicator(
                color: context.colors.background,
              ),
            )
          : Text(
              text,
              style: textStyle ?? context.textStyles.button,
            ),
    );
  }
}

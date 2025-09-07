import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';

/// A reusable button widget used for authentication-related screens that
/// displays a text label followed by a clickable redirect button.
///
/// Typically used for scenarios like:
/// - "Don't have an account? Sign up"
/// - "Already have an account? Log in"
///
/// Example usage:
/// ```dart
/// AuthRedirectButton(
///   text: "Don't have an account?",
///   redirectText: "Sign up",
///   onPressed: () {
///     // Navigate to sign up page
///   },
/// )
/// ```
final class AuthRedirectButton extends StatelessWidget {
  /// Creates an [AuthRedirectButton].
  ///
  /// [text] is the static text displayed before the button.
  /// [redirectText] is the clickable text that triggers [onPressed].
  /// [onPressed] is the callback executed when the redirect text is tapped.
  const AuthRedirectButton({
    required this.text,
    required this.redirectText,
    this.onPressed,
    super.key,
  });

  /// The static text displayed before the clickable redirect text.
  final String text;

  /// The clickable redirect text that usually navigates the user.
  final String redirectText;

  /// Callback function executed when the redirect text is pressed.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          text,
          style: context.textStyles.bodySmall,
        ),
        AppDimens.w4,
        TextButton(
          onPressed: onPressed,
          // Removes default padding, minimum size, ripple effect, and overlay color
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
          ),
          child: Text(
            redirectText,
            style: context.textStyles.smallLink,
          ),
        ),
      ],
    );
  }
}

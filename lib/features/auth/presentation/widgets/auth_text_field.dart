import 'package:connectinno_case_mobile/core/extensions/context_extensions.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A custom reusable text field used for authentication forms (login/register).
///
/// Features:
/// - Optional password obscuring with a toggle icon.
/// - Prefix icon support (SVG).
/// - Custom styling with consistent paddings and borders.
/// - Supports `validator`, `keyboardType`, `textInputAction`, and `onFieldSubmitted`.
///
/// ⚠️ **Warning:** If `obscureText` is true (password fields) and you are using multiple
/// fields in a flow (like Name → Email → Password → Confirm Password), make sure to
/// handle focus manually using `FocusScope.of(context).nextFocus()` in `onFieldSubmitted`.
/// Otherwise, pressing "Next" on the keyboard may close it unexpectedly.
final class AuthTextField extends StatefulWidget {
  /// Creates an `AuthTextField`.
  ///
  /// [hintText] is the placeholder text shown inside the field.
  /// [prefixIcon] is the path to an SVG asset displayed at the start of the field.
  /// [controller] manages the field's text.
  /// [obscureText] hides the text (used for password fields).
  /// [validator] optionally validates the input.
  /// [keyboardType] optionally defines the keyboard type (e.g., email, number).
  /// [textInputAction] defines the action button on the keyboard (Next, Done, etc.).
  /// [onFieldSubmitted] callback when the user submits the field (presses Next/Done).
  const AuthTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    super.key,
  });

  /// Placeholder text inside the text field.
  final String hintText;

  /// SVG icon path displayed at the start of the field.
  final String prefixIcon;

  /// Controller to read and manage the text input.
  final TextEditingController controller;

  /// Whether the text should be obscured (e.g., for passwords).
  final bool obscureText;

  /// Optional validation function for form validation.
  final String? Function(String?)? validator;

  /// Optional keyboard type (e.g., TextInputType.emailAddress).
  final TextInputType? keyboardType;

  /// Action button on the keyboard (Next, Done, etc.).
  final TextInputAction? textInputAction;

  /// Callback when user presses the keyboard action button.
  final void Function(String)? onFieldSubmitted;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

final class _AuthTextFieldState extends State<AuthTextField> {
  /// Tracks whether the text is currently obscured.
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: context.colors.primary,
      style: context.textStyles.body,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.textStyles.bodySmall,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.s24,
          vertical: AppDimens.s18,
        ),

        /// Prefix SVG icon
        prefixIcon: SizedBox(
          width: AppDimens.s50,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.s24,
              right: AppDimens.s8,
            ),
            child: SvgPicture.asset(
              widget.prefixIcon,
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: AppDimens.s50,
          minHeight: AppDimens.s20,
        ),

        /// Suffix icon for toggling password visibility
        suffixIcon: widget.obscureText
            ? IconButton(
                highlightColor: Colors.transparent,
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: AnimatedSwitcher(
                  duration: AppDimens.shortAnimationDuration,
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    key: ValueKey(_obscure),
                    size: AppDimens.s20,
                    color: context.colors.primary,
                  ),
                ),
              )
            : null,

        filled: true,
        fillColor: context.colors.background,

        /// Border styles
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.s18),
          borderSide: BorderSide(color: context.colors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.s18),
          borderSide: BorderSide(color: context.colors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.s18),
          borderSide: BorderSide(color: context.colors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.s18),
          borderSide: BorderSide(color: context.colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.s18),
          borderSide: BorderSide(color: context.colors.error),
        ),
        errorStyle: context.textStyles.bodySmall.copyWith(
          color: context.colors.error,
        ),
      ),
    );
  }
}

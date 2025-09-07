import 'package:connectinno_case_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Centralized static text styles for the app.
///
/// Use these for consistent typography across the app.
final class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation.

  /// Large headline text (28px, bold).
  static const TextStyle headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  /// Subtitle text (14px, regular).
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Button text (16px, bold).
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// Standard body text (15px, medium).
  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  /// Smaller body text (12px, regular).
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// Small link text (12px, bold).
  static const TextStyle smallLink = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}

/// A [ThemeExtension] that allows dynamic theming of text styles.
///
/// This enables the app to switch between different text style themes
/// (e.g., light, dark) while using [Theme.of(context).extension<AppTextStylesExtension>()].
final class AppTextStylesExtension
    extends ThemeExtension<AppTextStylesExtension> {
  /// Default light theme text styles.
  factory AppTextStylesExtension.light() {
    return AppTextStylesExtension._(
      headline: AppTextStyles.headline,
      subtitle: AppTextStyles.subtitle,
      body: AppTextStyles.body,
      smallLink: AppTextStyles.smallLink,
      bodySmall: AppTextStyles.bodySmall,
      button: AppTextStyles.button.copyWith(color: AppColors.backgroundLight),
    );
  }

  /// Private constructor.
  AppTextStylesExtension._({
    required this.headline,
    required this.subtitle,
    required this.body,
    required this.smallLink,
    required this.bodySmall,
    required this.button,
  });

  /// Large headline text (28px, bold).
  final TextStyle headline;

  /// Subtitle text (14px, regular).
  final TextStyle subtitle;

  /// Standard body text (15px, medium).
  final TextStyle body;

  /// Smaller body text (12px, regular).
  final TextStyle smallLink;

  /// Smaller body text (12px, regular).
  final TextStyle bodySmall;

  /// Button text (16px, bold).
  final TextStyle button;

  /// Returns a copy of this theme extension with optionally overridden styles.
  @override
  AppTextStylesExtension copyWith({
    TextStyle? headline,
    TextStyle? subtitle,
    TextStyle? body,
    TextStyle? smallLink,
    TextStyle? bodySmall,
    TextStyle? button,
  }) {
    return AppTextStylesExtension._(
      headline: headline ?? this.headline,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      smallLink: smallLink ?? this.smallLink,
      bodySmall: bodySmall ?? this.bodySmall,
      button: button ?? this.button,
    );
  }

  /// Linearly interpolates between two text style themes.
  ///
  /// Useful for smooth transitions between themes.
  @override
  AppTextStylesExtension lerp(
    ThemeExtension<AppTextStylesExtension>? other,
    double t,
  ) {
    if (other is! AppTextStylesExtension) return this;

    TextStyle lerpStyle(TextStyle a, TextStyle b, double t) =>
        TextStyle.lerp(a, b, t) ?? a;

    return AppTextStylesExtension._(
      headline: lerpStyle(headline, other.headline, t),
      subtitle: lerpStyle(subtitle, other.subtitle, t),
      body: lerpStyle(body, other.body, t),
      smallLink: lerpStyle(smallLink, other.smallLink, t),
      bodySmall: lerpStyle(bodySmall, other.bodySmall, t),
      button: lerpStyle(button, other.button, t),
    );
  }
}

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Centralized color definitions for the app.
abstract class AppColors {
  AppColors._();

  /// Primary color for light theme (black)
  static const Color primaryLight = Color(0xFF000000);

  static const Color primaryLight54 = Color(0x89000000);
  static const Color primaryLight38 = Color(0x60000000);
  static const Color primaryLight12 = Color(0x1F000000);

  /// Background color for light theme (white)
  static const Color backgroundLight = Color(0xFFFFFFFF);

  /// Error color for light theme (red)
  static const Color errorLight = Color(0xFFD32F2F);
}

/// A [ThemeExtension] that makes color palette themable.
///
/// Allows dynamic theme changes (light/dark/custom) while providing
/// type-safe access to app colors through `Theme.of(context).extension<AppColorsExtension>()`.
final class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  /// Private constructor.
  AppColorsExtension._({
    required this.primary,
    required this.primary54,
    required this.primary38,
    required this.primary12,
    required this.background,
    required this.error,
  });

  /// Default light theme color extension.
  factory AppColorsExtension.light() {
    return AppColorsExtension._(
      primary: AppColors.primaryLight,
      primary54: AppColors.primaryLight54,
      primary12: AppColors.primaryLight12,
      primary38: AppColors.primaryLight38,
      background: AppColors.backgroundLight,
      error: AppColors.errorLight,
    );
  }
  final Color primary;
  final Color primary54;
  final Color primary38;
  final Color primary12;
  final Color background;
  final Color error;

  /// Returns a copy of this extension with optionally overridden colors.
  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? primary38,
    Color? primary12,
    Color? background,
    Color? error,
    Color? primary54,
  }) {
    return AppColorsExtension._(
      primary: primary ?? this.primary,
      primary54: primary54 ?? this.primary54,
      primary38: primary38 ?? this.primary38,
      primary12: primary12 ?? this.primary12,
      background: background ?? this.background,
      error: error ?? this.error,
    );
  }

  /// Linearly interpolates between two color extensions.
  ///
  /// Useful for smooth theme transitions.
  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }

    Color lerpColor(Color a, Color b, double t) => Color.lerp(a, b, t) ?? a;

    return AppColorsExtension._(
      primary: lerpColor(primary, other.primary, t),
      primary54: lerpColor(primary54, other.primary54, t),
      primary38: lerpColor(primary38, other.primary38, t),
      primary12: lerpColor(primary12, other.primary12, t),
      background: lerpColor(background, other.background, t),
      error: lerpColor(error, other.error, t),
    );
  }
}

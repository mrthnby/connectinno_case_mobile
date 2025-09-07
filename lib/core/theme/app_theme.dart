import 'package:connectinno_case_mobile/core/theme/app_colors.dart';
import 'package:connectinno_case_mobile/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

/// Centralized theme configuration for the app.
final class AppTheme {
  AppTheme._();

  /// Returns the default light theme for the app.
  static ThemeData get light => ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.highContrastLight(
      primary: AppColors.primaryLight,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: AppColors.primaryLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.backgroundLight,
        textStyle: AppTextStyles.button.copyWith(
          color: AppColors.backgroundLight,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
    ),
    extensions: [
      AppColorsExtension.light(),
      AppTextStylesExtension.light(),
    ],
  );
}

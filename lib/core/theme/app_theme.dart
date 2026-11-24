import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    dividerTheme: DividerThemeData(color: AppPalette.light.divider),
    extensions: const <ThemeExtension<dynamic>>[AppPalette.light],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: const Color(0xFF121212),
    // A slightly brighter seed keeps M3 controls (switches, selections, etc.)
    // legible against the dark scaffold. Brand buttons keep the darker
    // AppColors.primaryColor via AppPalette.accent / explicit styling.
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimaryColor,
      brightness: Brightness.dark,
    ),
    dividerTheme: DividerThemeData(color: AppPalette.dark.divider),
    extensions: const <ThemeExtension<dynamic>>[AppPalette.dark],
  );
}

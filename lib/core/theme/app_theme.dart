import 'package:flutter/material.dart';
import 'package:todo_riverpod/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),

    // textfield decor
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface.withAlpha(100),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
        elevation: 0.0,
      ),
    ),

    // text button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
      )
    ),

    // card theme
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      )

    )
  );
}

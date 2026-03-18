import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        fontFamily: 'Inter',   // ← default font for whole app
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightAccent,
          surface: AppColors.lightSurface,
          onPrimary: Colors.white,
          onSurface: AppColors.lightPrimary,
        ),
        dividerColor: AppColors.lightBorder,
        cardColor: AppColors.lightCard,
        cardTheme: CardThemeData(
          color: AppColors.lightCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.lightBorder),
          ),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        fontFamily: 'Inter',   // ← default font for whole app
        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkAccent,
          surface: AppColors.darkSurface,
          onPrimary: Colors.white,
          onSurface: AppColors.darkPrimary,
        ),
        dividerColor: AppColors.darkBorder,
        cardColor: AppColors.darkCard,
        cardTheme: CardThemeData(
          color: AppColors.darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.darkBorder),
          ),
        ),
      );
}
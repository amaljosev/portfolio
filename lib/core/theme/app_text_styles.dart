import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Syne — for big headings
  static TextStyle displayLarge(Color color) => TextStyle(
        fontFamily: 'Syne',
        fontSize: 64,
        fontWeight: FontWeight.w800,
        color: color,
        height: 1.1,
        letterSpacing: -1.5,
      );

  static TextStyle displayMedium(Color color) => TextStyle(
        fontFamily: 'Syne',
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle headlineLarge(Color color) => TextStyle(
        fontFamily: 'Syne',
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle headlineMedium(Color color) => TextStyle(
        fontFamily: 'Syne',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.3,
      );

  // Inter — for everything else
  static TextStyle titleLarge(Color color) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
      );

  static TextStyle bodyLarge(Color color) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.7,
      );

  static TextStyle bodyMedium(Color color) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.7,
      );

  static TextStyle bodySmall(Color color) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.6,
      );

  static TextStyle labelMedium(Color color) => TextStyle(
        fontFamily: 'Inter',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.5,
      );
}
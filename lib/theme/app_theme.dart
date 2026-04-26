import 'package:flutter/material.dart';

// Simple colors - LeetCode style
class AppColors {
  static const bg      = Color(0xFF1A1A1A);
  static const surface = Color(0xFF282828);
  static const card    = Color(0xFF1E1E1E);
  static const border  = Color(0xFF3D3D3D);
  static const orange  = Color(0xFFFFA116);
  static const green   = Color(0xFF2DB55D);
  static const red     = Color(0xFFEF4743);
  static const text    = Color(0xFFEFEFEF);
  static const grey    = Color(0xFF8A8A8A);
}

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.surface,
      primaryColor: AppColors.orange,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.card,
        elevation: 0,
        foregroundColor: AppColors.text,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        bodyLarge:  TextStyle(color: AppColors.text, fontSize: 14),
        bodyMedium: TextStyle(color: AppColors.grey, fontSize: 13),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.orange,
        surface: AppColors.card,
      ),
    );
  }
}

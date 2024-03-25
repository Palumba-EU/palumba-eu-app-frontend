import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData themeData(isDarkTheme) {
    return ThemeData(
      fontFamily: GoogleFonts.merriweatherSans().fontFamily,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.background),
    );
  }
}

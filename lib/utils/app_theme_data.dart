import 'package:palumba_eu/utils/app_colors.dart';
import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData themeData(isDarkTheme) {
    return DUI.theme.themeData(
      false,
      customThemeData: ThemeData(
        fontFamily: GoogleFonts.merriweather().fontFamily,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      customColorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary, background: AppColors.background),
    );
  }
}

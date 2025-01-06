import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData themeData(isDarkTheme) {
    return ThemeData(
      fontFamily: 'merriweather-sans',
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme()
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primary,
        seedColor: AppColors.primary,
        surface: AppColors.background,
      ),
    );
  }
}

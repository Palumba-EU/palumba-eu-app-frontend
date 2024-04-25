import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class AppThemeData {
  static ThemeData themeData(isDarkTheme) {
    return ThemeData(
      fontFamily: GoogleFonts.merriweatherSans().fontFamily,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.merriweather(
            fontSize: AppDimens.fontSizeTitle,
            fontWeight: FontWeight.w900),
        titleMedium: GoogleFonts.merriweather(
            fontSize: AppDimens.fontSizeRegular,
            fontWeight: FontWeight.w900),
        titleSmall: GoogleFonts.merriweather(
            fontSize: AppDimens.fontSizeSmall,
            fontWeight: FontWeight.w900),
        bodyLarge: GoogleFonts.merriweatherSans(
            fontSize: AppDimens.fontSizeTitle,
            fontWeight: FontWeight.w300),
        bodyMedium: GoogleFonts.merriweatherSans(
            fontSize: AppDimens.fontSizeRegular,
            fontWeight: FontWeight.w300),
        bodySmall: GoogleFonts.merriweatherSans(
            fontSize: AppDimens.fontSizeSmall,
            fontWeight: FontWeight.w300),
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primary,
        seedColor: AppColors.primary,
        background: AppColors.background,
      ),
    );
  }
}

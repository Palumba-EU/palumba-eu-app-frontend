import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class AppTexts {
  static small(String text, {bool bold = false}) {
    return Text(text,
        style: TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: AppDimens.fontSizeSmall,
            color: AppColors.text,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal));
  }

  static regular(String text, {bool bold = false}) {
    return Text(text,
        style: TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: AppDimens.fontSizeRegular,
            color: AppColors.text,
            fontWeight: bold ? FontWeight.bold : FontWeight.w300));
  }

  static title(String text,) {
    return Text(text,
        style: TextStyle(
            fontFamily: GoogleFonts.merriweather().fontFamily,
            fontSize: AppDimens.fontSizeTitle,
            color: AppColors.text,
            fontWeight: FontWeight.bold));
  }
}

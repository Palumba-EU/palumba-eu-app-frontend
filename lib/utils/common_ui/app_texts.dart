import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class AppTexts {
  static small(
    String text, {
    bool bold = false,
    TextAlign? textAlign,
    Color? color,
    TextDecoration? decoration,
    double? fontSize,
    int? maxLines,
  }) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: TextStyle(
          fontFamily: GoogleFonts.merriweatherSans().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeSmall,
          color: color ?? AppColors.text,
          decorationColor: color ?? AppColors.text,
          fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
          decoration: decoration,
        ));
  }

  static medium(String text,
      {bool bold = false,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? decoration}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: AppDimens.fontSizeMedium,
            color: color ?? AppColors.text,
            decorationColor: AppColors.text,
            fontWeight: bold ? FontWeight.w900 : FontWeight.w300,
            decoration: decoration));
  }

  static regular(String text,
      {bool bold = false,
      bool black = false,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? decoration}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: AppDimens.fontSizeRegular,
            color: color ?? AppColors.text,
            decorationColor: AppColors.text,
            fontWeight: black
                ? FontWeight.w900
                : bold
                    ? FontWeight.bold
                    : FontWeight.w300,
            decoration: decoration));
  }

  static title(String text,
      {TextAlign? textAlign,
      Color? color,
      bool hasSerif = true,
      double? fontSize}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: hasSerif
              ? GoogleFonts.merriweather().fontFamily
              : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
          fontWeight: FontWeight.w900,
        ));
  }

  static customTextStyle(AppTextType appTexType,
      {Color? color,
      bool bold = false,
      TextDecoration? decoration,
      double? fontSize}) {
    switch (appTexType) {
      case AppTextType.title:
        return TextStyle(
          fontFamily: GoogleFonts.merriweather().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
          fontWeight: FontWeight.w900,
        );
      case AppTextType.regular:
        return TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: fontSize ?? AppDimens.fontSizeRegular,
            color: color ?? AppColors.text,
            decorationColor: AppColors.text,
            fontWeight: bold ? FontWeight.bold : FontWeight.w300,
            decoration: decoration);

      case AppTextType.small:
        return TextStyle(
            fontFamily: GoogleFonts.merriweatherSans().fontFamily,
            fontSize: fontSize ?? AppDimens.fontSizeSmall,
            color: color ?? AppColors.text,
            decorationColor: AppColors.text,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            decoration: TextDecoration.underline);
      default:
    }
  }
}

enum AppTextType { small, regular, title }

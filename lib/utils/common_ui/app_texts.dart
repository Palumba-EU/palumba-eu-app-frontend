import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class AppTexts {
  static small(
    String text, {
    bool black = false,
    bool bold = false,
    TextAlign? textAlign,
    Color? color,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: TextStyle(
          fontFamily:
              black ? 'caprasimo' : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: AppDimens.fontSizeSmall,
          color: color ?? AppColors.text,
          decorationColor: color ?? AppColors.text,
          fontWeight: bold ? FontWeight.w900 : FontWeight.w300,
          decoration: decoration,
        ));
  }

  static medium(String text,
      {bool black = false,
      bool bold = false,
      TextAlign? textAlign,
      Color? color,
      TextDecoration? decoration}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily:
              black ? GoogleFonts.caprasimo().fontFamily : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: AppDimens.fontSizeMedium,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: bold ? FontWeight.w900 : FontWeight.w300,
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        ));
  }

  static regular(String text,
      {bool black = false,
      bool bold = false,
      TextAlign? textAlign,
      Color? color,
      double? fontSize,
      TextDecoration? decoration}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily:
              black ? GoogleFonts.caprasimo().fontFamily : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeRegular,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: bold ? FontWeight.w900 : FontWeight.w300,
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        ));
  }

  static title(String text,
      {TextAlign? textAlign, Color? color, double? fontSize}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: GoogleFonts.caprasimo().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
          fontWeight: FontWeight.w400,
          height: AppDimens.blackFontHeight,
        ));
  }

  static customTextStyle(AppTextType appTexType,
      {bool black = false,
      bool bold = false,
      Color? color,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      double? fontSize}) {
    switch (appTexType) {
      case AppTextType.title:
        return TextStyle(
          fontFamily: GoogleFonts.caprasimo().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
          fontWeight: fontWeight ?? (black ? FontWeight.w400 : FontWeight.w900),
          height: black ? AppDimens.blackFontHeight : null,
        );
      case AppTextType.regular:
        return TextStyle(
          fontFamily:
              black ? GoogleFonts.caprasimo().fontFamily : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeRegular,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: fontWeight ??
              (bold
                  ? black
                      ? FontWeight.w400
                      : FontWeight.w900
                  : FontWeight.w300),
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        );

      case AppTextType.small:
        return TextStyle(
          fontFamily:
              black ? GoogleFonts.caprasimo().fontFamily : GoogleFonts.merriweatherSans().fontFamily,
          fontSize: fontSize ?? AppDimens.fontSizeSmall,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: fontWeight ??
              (bold
                  ? black
                      ? FontWeight.w400
                      : FontWeight.w900
                  : FontWeight.w300),
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        );
      default:
    }
  }
}

enum AppTextType { small, regular, title }

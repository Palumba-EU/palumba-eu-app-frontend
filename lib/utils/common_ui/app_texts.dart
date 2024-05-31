import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';

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
          fontFamily: black ? getBlackFontFamily() : 'merriweather-sans',
          fontSize: AppDimens.fontSizeSmall,
          color: color ?? AppColors.text,
          decorationColor: color ?? AppColors.text,
          fontWeight: black
              ? null
              : bold
                  ? FontWeight.bold
                  : FontWeight.w300,
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
          fontFamily: black ? getBlackFontFamily() : 'merriweather-sans',
          fontSize: AppDimens.fontSizeMedium,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: black
              ? null
              : bold
                  ? FontWeight.bold
                  : FontWeight.w300,
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
          fontFamily: black ? getBlackFontFamily() : 'merriweather-sans',
          fontSize: fontSize ?? AppDimens.fontSizeRegular,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: black
              ? null
              : bold
                  ? FontWeight.bold
                  : FontWeight.w300,
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        ));
  }

  static title(String text,
      {bool forceCaprasimo = false,
      TextAlign? textAlign,
      Color? color,
      double? fontSize}) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: forceCaprasimo ? 'caprasimo' : getBlackFontFamily(),
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
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
          fontFamily: getBlackFontFamily(),
          fontSize: fontSize ?? AppDimens.fontSizeTitle,
          color: color ?? AppColors.text,
          height: black ? AppDimens.blackFontHeight : null,
        );
      case AppTextType.regular:
        return TextStyle(
          fontFamily: black ? getBlackFontFamily() : 'merriweather-sans',
          fontSize: fontSize ?? AppDimens.fontSizeRegular,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: black
              ? null
              : bold
                  ? FontWeight.bold
                  : FontWeight.w300,
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        );

      case AppTextType.small:
        return TextStyle(
          fontFamily: black ? getBlackFontFamily() : 'merriweather-sans',
          fontSize: fontSize ?? AppDimens.fontSizeSmall,
          color: color ?? AppColors.text,
          decorationColor: AppColors.text,
          fontWeight: black
              ? null
              : bold
                  ? FontWeight.bold
                  : FontWeight.w300,
          decoration: decoration,
          height: black ? AppDimens.blackFontHeight : null,
        );
      default:
    }
  }

  static String getBlackFontFamily() {
    switch (LanguageManager.currentLanguage) {
      case 'ro':
      case 'cs':
      case 'sk':
      case 'hr':
      case 'hu':
      case 'sl':
      case 'bg':
      case 'pl':
        return 'merriweather-black';
      case 'el':
        return 'noto-serif-black';
      default:
        return 'caprasimo';
    }
  }
}

enum AppTextType { small, regular, title }

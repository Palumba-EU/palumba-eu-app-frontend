import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/utils/managers/credentials_manager.dart';

class Styles {
  static bool darkMode = false;

  static const Color colorText = Color(0xFF323232);
  static const Color inputFillColorLight = Color(0XFFf1f1f1);
  static const Color inputFillColorDark = Color(0XFF444E5E);

  static const double smallBorderRadius = 2.0;
  static const double borderRadius = 12.0;
  static const double largeBorderRadius = 24.0;
  static const double paddingValue = 12.0;

  static const double fontSizeSmall = 12;
  static const double fontSizeRegularText = 14;
  static const double fontSizeMediumText = 16;

  static const double fontSizeH1Title = 18;
  static const double fontSizeH2Title = 26;
  static const double fontSizeH3Title = 32;

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      platform:
          Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      fontFamily: '',
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: colorText,
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xff323A43) : const Color(0XFFF8F8F8),
      colorScheme: ColorScheme(
        primary: CredentialsManager.isDev()
            ? const Color(0xFFF15657)
            : const Color(0xFFF15657),
        secondary: isDarkTheme
            ? Colors.white
            : CredentialsManager.isDev()
                ? const Color(0xFFF15657)
                : const Color(0xFFF15657),
        surface: Colors.white,
        background: Colors.white,
        error: const Color(0xffb00020),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Styles.borderRadius),
              borderSide: BorderSide(
                  color: isDarkTheme
                      ? const Color(0XFF444E5E)
                      : const Color(0XFFE7E7E7),
                  width: 0.5)),
          fillColor:
              isDarkTheme ? const Color(0XFF444E5E) : const Color(0XFFFFFFFF)),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: isDarkTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: isDarkTheme ? Colors.white : const Color(0XFF383838)),
      ),
    );
  }

  /*
  * Headers and Titles
  * */
  static Widget h1TitleText(context, text,
      {color, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSizeH1Title,
          color: color ?? Styles.colorText,
          fontWeight: FontWeight.bold,
          decoration: decoration),
    );
  }

  static Widget h2TitleText(context, text,
      {color, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSizeH2Title,
          color: color ?? Styles.colorText,
          fontWeight: FontWeight.bold,
          decoration: decoration),
    );
  }

  static Widget h3TitleText(context, text,
      {color, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSizeH3Title,
          color: color ?? Styles.colorText,
          fontWeight: FontWeight.bold,
          decoration: decoration),
    );
  }

  /*
  * Body and Text
  * */
  static Widget smallText(context, text,
      {color,
      decoration = TextDecoration.none,
      textAlign,
      maxLines,
      softWrap,
      overflow}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : overflow,
      softWrap: softWrap,
      style: TextStyle(
          fontSize: fontSizeSmall,
          color: color ?? Styles.colorText,
          height: 1.2,
          fontWeight: FontWeight.w300,
          decoration: decoration),
    );
  }

  static Widget regularText(context, text,
      {fontSize, color, height, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSize ?? fontSizeRegularText,
          color: color ?? Styles.colorText,
          height: height ?? 1.2,
          fontWeight: FontWeight.w400,
          decoration: decoration),
    );
  }

  static Widget demiBoldText(context, text,
      {fontSize, color, height, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSize ?? fontSizeRegularText,
          color: color ?? Styles.colorText,
          height: height ?? 1.2,
          fontWeight: FontWeight.w600,
          decoration: decoration),
    );
  }

  static Widget boldText(context, text,
      {fontSize, color, height, decoration = TextDecoration.none, textAlign, maxLines}) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontSize: fontSize ?? fontSizeRegularText,
          color: color ?? Styles.colorText,
          height: height ?? 1.2,
          fontWeight: FontWeight.bold,
          decoration: decoration),
    );
  }

  /*
  * Spaces
  * */
  static Widget spacer({int multiplier = 1, bool small = false}) {
    if (small) {
      return const SizedBox(height: paddingValue / 2);
    }
    return SizedBox(
      height: paddingValue * multiplier,
    );
  }

  static Widget horizontalSpaces({int multiplier = 1, bool small = false}) {
    if (small) {
      return const SizedBox(width: paddingValue / 2);
    }
    return SizedBox(
      width: paddingValue * multiplier,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDimens {
  /// Margins
  ///
  static const double smallPaddingValue = 8;
  static const double extraSmallLateralPaddingValue = 4;
  static const double smallLateralPaddingValue = 12;
  static const double regularLateralPaddingValue = 16;
  static const double mediumLateralPaddingValue = 20;
  static const double bigLateralPaddingValue = 32;
  static const double lateralPaddingValue = 24;
  static const double largeLateralPaddingValue = 40;
  static const double extraLargeLateralPaddingValue = 48;

  static EdgeInsets lateralPadding =
      EdgeInsets.symmetric(horizontal: lateralPaddingValue);

  /// Border Radius
  ///
  static const double borderRadius = 12.0;
  static const double largeBorderRadius = 16.0;

  /// Border Width
  ///
  static const double borderWidth = 2;

  /// Font Sizes
  ///
  static const double fontSizeSmall = 12.0;
  static const double fontSizeRegular = 16.0;
  static const double fontSizeTitle = 22.0;
  static const double fontSizeBig = 32.0;
}

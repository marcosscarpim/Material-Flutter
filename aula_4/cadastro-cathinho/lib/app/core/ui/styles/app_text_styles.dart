import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;

  AppTextStyles._();

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Lexend';
  String get secondaryFont => 'Inter';

  TextStyle get textHeadingH1 => TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );

  TextStyle get textHeadingH2 => TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );

  TextStyle get textHeadingH3 => TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );

  TextStyle get textHeadingH4 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );

  TextStyle get textHeadingH5 => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );

  TextStyle get textHeadingH6 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );

  TextStyle get textSubheadingLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: secondaryFont,
      );

  TextStyle get textSubheadingMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: secondaryFont,
      );

  TextStyle get textBodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: secondaryFont,
      );

  TextStyle get textBodyMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: secondaryFont,
      );

  TextStyle get textButtonLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: secondaryFont,
      );

  TextStyle get textButtonMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: secondaryFont,
      );

  TextStyle get textButtonSmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: secondaryFont,
      );

  TextStyle get textDescriptionFootnote => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: secondaryFont,
      );

  TextStyle get textDescriptionCaption => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: secondaryFont,
      );

  TextStyle get labelTextField => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: secondaryFont,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.instance;
}

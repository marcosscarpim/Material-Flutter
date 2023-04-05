import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFFE71B7B);
  Color get secondary => const Color(0xFF611F96);
  Color get black => const Color(0xFF34313F);
  Color get blue => const Color(0xFF697DFF);
  Color get yellow => const Color(0xFFF5B300);
  Color get orange => const Color(0xFFF07900);
  Color get green => const Color(0xFF02D4A0);
  Color get textFieldBorderColor => const Color(0xFFD9D9D9);
  Color get neutral => const Color(0xFFF0F0F0);
  Color get labelNeutral => const Color(0xFFBFBFBF);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.instance;
}

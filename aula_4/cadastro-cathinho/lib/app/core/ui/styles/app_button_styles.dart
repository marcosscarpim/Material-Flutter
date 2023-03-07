import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {
  static AppButtonStyles? _instance;

  AppButtonStyles._();

  static AppButtonStyles get instance {
    _instance ??= AppButtonStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.instance.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextStyles.instance.textButtonLarge.copyWith(color: Colors.white),
      );

  ButtonStyle get primaryOutlineButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: AppColors.instance.secondary),
        textStyle: AppTextStyles.instance.textButtonLarge.copyWith(color: AppColors.instance.secondary),
      );
}

extension AppButtonStylesExtensions on BuildContext {
  AppButtonStyles get buttonStyles => AppButtonStyles.instance;
}

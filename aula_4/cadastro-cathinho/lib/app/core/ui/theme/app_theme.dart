import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.secondary,
      elevation: 0,
      centerTitle: true,
    ),
    primaryColor: AppColors.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      primary: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      isDense: true,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder,
      focusedErrorBorder: _defaultInputBorder,
      errorStyle: const TextStyle(),
      errorMaxLines: 1,
      labelStyle: AppTextStyles.instance.labelTextField.copyWith(
        color: AppColors.instance.labelNeutral,
      ),
    ),
  );

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(2),
    borderSide: BorderSide(color: AppColors.instance.textFieldBorderColor, width: 1),
  );
}

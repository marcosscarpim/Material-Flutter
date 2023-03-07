import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.secondary,
      elevation: 0,
    ),
  );
}

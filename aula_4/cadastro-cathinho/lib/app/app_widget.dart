import 'package:cadastro_cathinho/app/core/ui/theme/app_theme.dart';
import 'package:cadastro_cathinho/app/pages/register_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cathinho',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const RegisterPage(),
    );
  }
}

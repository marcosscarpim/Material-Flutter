import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.instance.neutral,
      width: MediaQuery.of(context).size.width,
      height: 32,
      child: const Center(
        child: Text(
          'Designed by Venturus. All rights reserved.',
        ),
      ),
    );
  }
}

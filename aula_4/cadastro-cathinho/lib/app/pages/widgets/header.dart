import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 80, right: 32),
      child: Column(
        children: [
          Text(
            'Cadastro',
            textAlign: TextAlign.center,
            style: AppTextStyles.instance.textHeadingH3.copyWith(fontWeight: FontWeight.w400, fontSize: 38),
          ),
          const SizedBox(height: 32),
          Text(
            'Fusce volutpat lectus et nisl consectetur finibus. In vitae scelerisque augue, in varius eros.',
            textAlign: TextAlign.justify,
            style: AppTextStyles.instance.textDescriptionCaption,
          ),
        ],
      ),
    );
  }
}

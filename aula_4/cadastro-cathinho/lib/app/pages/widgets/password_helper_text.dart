import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordHelperText extends StatelessWidget {
  final List<String> texts;

  const PasswordHelperText(this.texts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];

    for (var text in texts) {
      widgetList.add(PasswordHelperItem(text));
    }

    return Column(
      children: widgetList,
    );
  }
}

class PasswordHelperItem extends StatelessWidget {
  final String text;

  const PasswordHelperItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: AppTextStyles.instance.textBodyMedium,
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.instance.textBodyMedium.copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

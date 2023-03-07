import 'package:cadastro_cathinho/app/core/ui/styles/app_button_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const AppButton({
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
    Key? key,
  }) : super(key: key);

  AppButton.primary({
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    Key? key,
  })  : style = AppButtonStyles.instance.primaryButton,
        labelStyle = AppTextStyles.instance.textButtonLarge,
        outline = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      height: height,
      width: width,
      child: outline
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}

import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final String label;
  final FloatingLabelBehavior labelBehavior;
  final bool isObscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final List<TextInputFormatter>? formatters;
  final Icon? suffixIcon;
  final EdgeInsets? customContentPadding;

  AppTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.formatters,
    this.suffixIcon,
    this.customContentPadding,
    this.keyboardType = TextInputType.text,
    this.labelBehavior = FloatingLabelBehavior.never,
    this.isObscureText = false,
  })  : _obscureTextVN = ValueNotifier<bool>(isObscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            floatingLabelBehavior: labelBehavior,
            contentPadding: customContentPadding,
            labelText: label,
            suffixIcon: isObscureText
                ? InkWell(
                    onTap: () => _obscureTextVN.value = !obscureTextVNValue,
                    child: Icon(
                      obscureTextVNValue ? Icons.lock : Icons.lock_open,
                      color: AppColors.instance.labelNeutral,
                      size: 18,
                    ),
                  )
                : suffixIcon,
            suffixIconConstraints: const BoxConstraints(minWidth: 42),
          ),
          obscureText: obscureTextVNValue,
          keyboardType: keyboardType,
          inputFormatters: formatters,
          validator: validator,
        );
      },
    );
  }
}

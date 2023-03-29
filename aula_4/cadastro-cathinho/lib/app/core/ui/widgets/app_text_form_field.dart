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
            label: Text(label),
            suffixIcon: isObscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextVNValue;
                    },
                    icon: Icon(obscureTextVNValue ? Icons.lock : Icons.lock_open),
                  )
                : suffixIcon,
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

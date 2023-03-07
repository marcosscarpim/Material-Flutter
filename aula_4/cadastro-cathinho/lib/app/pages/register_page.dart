import 'package:cadastro_cathinho/app/core/ui/styles/app_button_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text('Nome'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onPressed: () {},
                    style: context.buttonStyles.primaryOutlineButton,
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    label: 'Cancelar',
                    labelStyle: context.textStyles.textButtonLarge.copyWith(color: context.colors.secondary),
                    outline: true,
                  ),
                  const SizedBox(height: 24),
                  AppButton.primary(
                    onPressed: () {},
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    label: 'Cadastrar',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

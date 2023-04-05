import 'package:cadastro_cathinho/app/core/ui/styles/app_button_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_button.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_calendar_button.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_text_form_field.dart';
import 'package:cadastro_cathinho/app/pages/widgets/footer.dart';
import 'package:cadastro_cathinho/app/pages/widgets/password_helper_text.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameEC = TextEditingController();
  final _lastNameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _birthDateEC = TextEditingController();
  final _phoneNumberEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();
  bool _termsAndConditionsChecked = false;

  @override
  void dispose() {
    _firstNameEC.dispose();
    _lastNameEC.dispose();
    _emailEC.dispose();
    _cpfEC.dispose();
    _birthDateEC.dispose();
    _phoneNumberEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 32, top: 80, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  AppTextFormField(
                    controller: _firstNameEC,
                    label: 'Nome',
                    keyboardType: TextInputType.name,
                    validator: (value) => Mask.validations.generic(value, error: 'Nome inválido', min: 3),
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    controller: _lastNameEC,
                    label: 'Sobrenome',
                    keyboardType: TextInputType.name,
                    validator: (value) => Mask.validations.generic(value, error: 'Sobrenome inválido'),
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    controller: _emailEC,
                    label: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Mask.validations.email(value),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: _cpfEC,
                          label: 'CPF',
                          keyboardType: TextInputType.number,
                          validator: (value) => Mask.validations.cpf(value),
                          formatters: [Mask.cpf()],
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Expanded(
                        child: AppCalendarButton(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    controller: _phoneNumberEC,
                    label: 'Celular',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      return Mask.validations.phone(value, error: 'Número de Celular inválido');
                    },
                    formatters: [
                      Mask.phone(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    controller: _passwordEC,
                    label: 'Senha',
                    isObscureText: true,
                    validator: (value) => Mask.validations.generic(value, error: 'Senha inválida', min: 8),
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    controller: _confirmPasswordEC,
                    label: 'Confirmar Senha',
                    isObscureText: true,
                    validator: (value) {
                      return Mask.validations.multiple(
                        validations: [
                          Mask.validations.generic(
                            value,
                            error: 'Confirmar Senha inválida',
                            min: 8,
                          ),
                          Mask.validations.compare(
                            value,
                            compareTo: _confirmPasswordEC.text,
                            error: 'Senha e Confirmar Senha não são iguais',
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const PasswordHelperText([
                    'Minimo de 8 caracteres',
                    'Usar um número (0 - 9)',
                    'Usar letra maiúscula',
                    r'Usar caractere especial (!@#$%&*)'
                  ]),
                  const SizedBox(height: 24),
                  CheckboxListTile(
                    value: _termsAndConditionsChecked,
                    onChanged: (_) {
                      setState(() {
                        _termsAndConditionsChecked = !_termsAndConditionsChecked;
                      });
                    },
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      side: BorderSide(color: AppColors.instance.textFieldBorderColor, width: 0.1),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Concordo com os ',
                          style: AppTextStyles.instance.textBodyMedium,
                        ),
                        Text(
                          'Termos e Condições',
                          style: AppTextStyles.instance.textBodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            color: AppColors.instance.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
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
                    onPressed: () {
                      final formValid = _formKey.currentState!.validate();

                      if (formValid) {
                        // TODO: Show Snackbar
                      }
                    },
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    label: 'Cadastrar',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

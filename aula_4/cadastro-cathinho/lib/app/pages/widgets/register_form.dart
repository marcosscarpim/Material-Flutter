import 'package:cadastro_cathinho/app/core/ui/styles/app_button_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_colors.dart';
import 'package:cadastro_cathinho/app/core/ui/styles/app_text_styles.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_button.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_calendar_button.dart';
import 'package:cadastro_cathinho/app/core/ui/widgets/app_text_form_field.dart';
import 'package:cadastro_cathinho/app/pages/widgets/password_helper_text.dart';
import 'package:flutter/material.dart';
import 'package:mask/mask.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameEC;
  final TextEditingController _lastNameEC;
  final TextEditingController _emailEC;
  final TextEditingController _cpfEC;
  final TextEditingController _phoneNumberEC;
  final TextEditingController _passwordEC;
  final TextEditingController _confirmPasswordEC;
  final bool isTermsAndConditionsCheckboxAccepted;
  final ValueNotifier<bool> _termsAndConditionsCheckboxVN;

  RegisterForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameEC,
    required TextEditingController lastNameEC,
    required TextEditingController emailEC,
    required TextEditingController cpfEC,
    required TextEditingController phoneNumberEC,
    required TextEditingController passwordEC,
    required TextEditingController confirmPasswordEC,
    this.isTermsAndConditionsCheckboxAccepted = false,
  })  : _formKey = formKey,
        _firstNameEC = firstNameEC,
        _lastNameEC = lastNameEC,
        _emailEC = emailEC,
        _cpfEC = cpfEC,
        _phoneNumberEC = phoneNumberEC,
        _passwordEC = passwordEC,
        _confirmPasswordEC = confirmPasswordEC,
        _termsAndConditionsCheckboxVN = ValueNotifier<bool>(isTermsAndConditionsCheckboxAccepted),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 80, right: 32),
      child: Form(
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
            _verticalSpace(24),
            AppTextFormField(
              controller: _lastNameEC,
              label: 'Sobrenome',
              keyboardType: TextInputType.name,
              validator: (value) => Mask.validations.generic(value, error: 'Sobrenome inválido'),
            ),
            _verticalSpace(24),
            AppTextFormField(
              controller: _emailEC,
              label: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Mask.validations.email(value),
            ),
            _verticalSpace(24),
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
            _verticalSpace(24),
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
            _verticalSpace(24),
            AppTextFormField(
              controller: _passwordEC,
              label: 'Senha',
              isObscureText: true,
              validator: (value) => Mask.validations.generic(value, error: 'Senha inválida', min: 8),
            ),
            _verticalSpace(24),
            AppTextFormField(
              controller: _confirmPasswordEC,
              label: 'Confirmar Senha',
              isObscureText: true,
              validator: (value) {
                return Mask.validations.multiple(
                  validations: [
                    Mask.validations.compare(
                      value,
                      compareTo: _passwordEC.text,
                      error: 'Senha e Confirmar Senha não conferem',
                    ),
                  ],
                );
              },
            ),
            _verticalSpace(24),
            const PasswordHelperText([
              'Minimo de 8 caracteres',
              'Usar um número (0 - 9)',
              'Usar letra maiúscula',
              r'Usar caractere especial (!@#$%&*)'
            ]),
            _verticalSpace(24),
            ValueListenableBuilder(
              valueListenable: _termsAndConditionsCheckboxVN,
              builder: (_, termsAndConditionsCheckboxVNValue, child) {
                return CheckboxListTile(
                  value: termsAndConditionsCheckboxVNValue,
                  onChanged: (_) => _termsAndConditionsCheckboxVN.value = !termsAndConditionsCheckboxVNValue,
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                    side: BorderSide(color: AppColors.instance.textFieldBorderColor, width: 0.1),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                );
              },
            ),
            _verticalSpace(34),
            AppButton(
              onPressed: () => _showSnackBar(context, message: 'Funcionalidade ainda não implementada'),
              style: context.buttonStyles.primaryOutlineButton,
              height: 40,
              width: MediaQuery.of(context).size.width,
              label: 'Cancelar',
              labelStyle: context.textStyles.textButtonLarge.copyWith(color: context.colors.secondary),
              outline: true,
            ),
            _verticalSpace(24),
            AppButton.primary(
              onPressed: () {
                final formValid = _formKey.currentState!.validate();

                if (formValid) {
                  _validateIfCheckboxIsAccepted(context);
                }
              },
              height: 40,
              width: MediaQuery.of(context).size.width,
              label: 'Cadastrar',
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(height: height);
  }

  void _validateIfCheckboxIsAccepted(BuildContext context) {
    if (_termsAndConditionsCheckboxVN.value == true) {
      _showSnackBar(context, message: 'Cadastro realizado com sucesso!');
    } else {
      _showSnackBar(context, message: 'Aceite os Termos e Condições de aplicativo para continuar!!');
    }
  }

  void _showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.instance.textBodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.instance.orange,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }
}

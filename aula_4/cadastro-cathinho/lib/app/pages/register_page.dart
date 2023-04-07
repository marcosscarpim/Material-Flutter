import 'package:cadastro_cathinho/app/pages/widgets/footer.dart';
import 'package:cadastro_cathinho/app/pages/widgets/header.dart';
import 'package:cadastro_cathinho/app/pages/widgets/register_form.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            // const SizedBox(height: 24), // Espaço entre o Header e o Form ficou muito grande
            RegisterForm(
              formKey: _formKey,
              firstNameEC: _firstNameEC,
              lastNameEC: _lastNameEC,
              emailEC: _emailEC,
              cpfEC: _cpfEC,
              phoneNumberEC: _phoneNumberEC,
              passwordEC: _passwordEC,
              confirmPasswordEC: _confirmPasswordEC,
            ),
            const SizedBox(height: 38),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

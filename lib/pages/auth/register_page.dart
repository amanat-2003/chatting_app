import 'package:chatting_app/pages/auth/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_field_widget.dart';
import '../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  login() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          child: Column(
            children: [
              const Text(
                'Yanamn!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Create your account now to chat and explore',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Image.asset(
                'assets/register.png',
                width: double.infinity,
              ),
              FormFieldWiget(formKey: formKey, login: login,toRegister: true),
              const SizedBox(height: 5),
              Text.rich(TextSpan(
                text: 'Already have an account?',
                children: [
                  TextSpan(
                      text: 'Login now',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          nextScreenReplacement(
                            context,
                            const LoginPage(),
                          );
                        }),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

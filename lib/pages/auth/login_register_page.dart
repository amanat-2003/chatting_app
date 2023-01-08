import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_field_widget.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool toRegister = false;
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
              Text(
                toRegister
                    ? 'Create your account now to chat and explore'
                    : 'Login now to see what they are talking!',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Image.asset(
                toRegister ? 'assets/register.png' : 'assets/login.png',
                width: double.infinity,
              ),
              FormFieldWiget(
                  formKey: formKey, login: login, toRegister: toRegister),
              const SizedBox(height: 5),
              Text.rich(TextSpan(
                text: toRegister
                    ? 'Already have an account?'
                    : 'Don\'t have an account?',
                children: [
                  TextSpan(
                      text: toRegister ? 'Login now' : 'Register here',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            toRegister = !toRegister;
                          });
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

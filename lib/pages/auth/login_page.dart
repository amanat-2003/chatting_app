import 'package:chatting_app/pages/auth/register_page.dart';
import 'package:chatting_app/widgets/form_field_widget.dart';
import 'package:chatting_app/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';

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
                'Login now to see what they are talking!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Image.asset(
                'assets/login.png',
                width: double.infinity,
              ),
              FormFieldWiget(formKey: formKey, login: login,toRegister: false,),
              const SizedBox(height: 5),
              Text.rich(TextSpan(
                text: 'Don\'t have an account?',
                children: [
                  TextSpan(
                      text: 'Register here',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          nextScreenReplacement(
                            context,
                            const RegisterPage(),
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

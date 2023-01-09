import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_field_widget.dart';
import '../../widgets/widgets.dart';

enum AuthMode { register, login }

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with SingleTickerProviderStateMixin {
  AuthMode authMode = AuthMode.login;
  final formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var fullname = '';
  var _obscureText = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  List<Image> imageList = [
    Image.asset(
      'assets/login.png',
      key: const ValueKey(1),
      width: double.infinity,
    ),
    Image.asset(
      'assets/register.png',
      key: const ValueKey(2),
      width: double.infinity,
    ),
  ];
  int imageIdx = 0;

  login() {
    if (formKey.currentState!.validate()) {}
  }

  register() {
    if (formKey.currentState!.validate()) {}
  }

  void _switchAuthMode() {
    if (imageIdx == 0) {
      setState(() {
        imageIdx = 1;
      });
    } else {
      setState(() {
        imageIdx = 0;
      });
    }
    if (authMode == AuthMode.login) {
      setState(() {
        authMode = AuthMode.register;
      });
      _controller.forward();
    } else {
      setState(() {
        authMode = AuthMode.login;
      });
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
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
                authMode == AuthMode.register
                    ? 'Create your account now to chat and explore'
                    : 'Login now to see what they are talking!',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: imageList[imageIdx],
              ),
              // FormFieldWiget(
              //     formKey: formKey,
              //     auth: authMode == AuthMode.register ? register : login,
              //     toRegister: authMode == AuthMode.register),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                height: authMode == AuthMode.register ? 270 : 210,
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            height: authMode == AuthMode.register ? 60 : 0,
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: TextFormField(
                                enabled: authMode == AuthMode.register,
                                keyboardType: TextInputType.name,
                                decoration: inpDecor.copyWith(
                                  labelText: 'Full Name',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                onChanged: (value) {
                                  fullname = value;
                                },
                                validator: (val) {
                                  if (val != null) {
                                    if (val.isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'Name cannot be empty';
                                    }
                                  } else {
                                    return 'Name cannot be empty';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            decoration: inpDecor.copyWith(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                            validator: (val) {
                              if (val != null) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : 'Please give a valid value of email!';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            decoration: inpDecor.copyWith(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ),
                            obscureText: _obscureText,
                            onChanged: (value) {
                              password = value;
                            },
                            validator: (val) {
                              if (val != null) {
                                if (val.length < 6) {
                                  return 'Password should have length of atleast 6 characters.';
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: authMode == AuthMode.register
                                  ? register
                                  : login,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Text(
                                  authMode == AuthMode.register
                                      ? 'Register'
                                      : 'Sign In',
                                  style: const TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 5),
              Text.rich(TextSpan(
                text: authMode == AuthMode.register
                    ? 'Already have an account?'
                    : 'Don\'t have an account?',
                children: [
                  TextSpan(
                      text: authMode == AuthMode.register
                          ? 'Login now'
                          : 'Register here',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _switchAuthMode()),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

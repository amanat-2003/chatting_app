// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chatting_app/widgets/widgets.dart';

class FormFieldWiget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() auth;
  final bool toRegister;

  const FormFieldWiget({
    Key? key,
    required this.formKey,
    required this.auth,
    required this.toRegister,
  }) : super(key: key);

  @override
  State<FormFieldWiget> createState() => _FormFieldWigetState();
}

class _FormFieldWigetState extends State<FormFieldWiget>
    with SingleTickerProviderStateMixin {
  var email = '';
  var password = '';
  var fullname = '';
  var _obscureText = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: widget.toRegister ? 270 : 210,
      child: Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: widget.toRegister ? 60 : 0,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: TextFormField(
                      enabled: widget.toRegister,
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
                    onPressed: widget.auth,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(widget.toRegister ? 'Register' : 'Sign In',
                        style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

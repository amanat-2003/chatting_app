// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chatting_app/widgets/widgets.dart';

class FormFieldWiget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() login;
  final bool toRegister;

  const FormFieldWiget({
    Key? key,
    required this.formKey,
    required this.login,
    required this.toRegister,
  }) : super(key: key);

  @override
  State<FormFieldWiget> createState() => _FormFieldWigetState();
}

class _FormFieldWigetState extends State<FormFieldWiget> {
  var email = '';
  var password = '';
  var fullname = '';
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            if (widget.toRegister)
              TextFormField(
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
                      _obscureText ? Icons.visibility : Icons.visibility_off,
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
                onPressed: widget.login,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(widget.toRegister ? 'Register' : 'Sign In',
                    style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ));
  }
}

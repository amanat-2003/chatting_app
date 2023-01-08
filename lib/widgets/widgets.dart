import 'package:flutter/material.dart';

const inpDecor = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 238, 104, 14), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 238, 104, 14), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 238, 104, 14), width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 238, 104, 14), width: 2),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 238, 104, 14), width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => page,
  ));
}

void nextScreenReplacement(context, page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => page,
  ));
}

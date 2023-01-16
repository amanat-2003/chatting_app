import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool _isPressed = false;
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = _isDarkMode
        ? const Color.fromARGB(255, 54, 54, 54)
        : const Color.fromARGB(255, 224, 116, 116);
    var dist = _isPressed ? const Offset(10, 10) : const Offset(15, 15);
    double blur = _isPressed ? 10 : 30;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Listener(
          onPointerUp: (event) => setState(() {
            _isPressed = false;
            // _isDarkMode = true;
          }),
          onPointerDown: (event) => setState(() {
            _isPressed = true;
            // _isDarkMode = false;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    offset: dist,
                    blurRadius: blur,
                    inset: _isPressed,
                  ),
                  BoxShadow(
                    offset: -dist,
                    blurRadius: blur,
                    color: _isDarkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 235, 182, 182),
                    inset: _isPressed,
                  ),
                ]),
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

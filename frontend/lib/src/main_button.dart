import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String title;
  final Color buttonColor;

  const MainButton(
      {required this.title, super.key, this.buttonColor = Colors.deepPurple});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  late bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(340, 50)),
        elevation: _isPressed
            ? MaterialStateProperty.all<double>(0.0)
            : MaterialStateProperty.all<double>(10.0),
        backgroundColor: MaterialStateProperty.all<Color>(_isPressed ? Colors.deepPurple.shade300 : Colors.deepPurple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: widget.buttonColor),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(widget.title,
            style: const TextStyle(fontSize: 20)
      ),
    ),
    );
  }
}

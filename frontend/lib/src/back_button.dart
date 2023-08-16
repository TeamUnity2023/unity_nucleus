import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  final String title;

  const CustomBackButton({required this.title,super.key});
  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  final bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){_isPressed != _isPressed;},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.deepPurple),
            ),
          ),
        ), child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(widget.title),
        ));
  }
}

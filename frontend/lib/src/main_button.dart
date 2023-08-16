import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String title;

   const MainButton({required this.title,super.key});
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  late bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){setState(() {
      _isPressed = !_isPressed;
    });},
    style: ButtonStyle( elevation: _isPressed ? MaterialStateProperty.all<double>(0.0) : MaterialStateProperty.all<double>(10.0),
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

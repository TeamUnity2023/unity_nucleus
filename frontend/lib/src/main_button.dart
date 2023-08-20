import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String title;
  final Color buttonColor;
  final VoidCallback whenPressed;
  final double buttonWidth;
   const MainButton({super.key, required this.title, this.buttonColor = Colors.deepPurple,this.buttonWidth = 340.0, required this.whenPressed});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  late bool _isPressed;

  @override
  void initState() {
    super.initState();
    _isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isPressed ? Colors.deepPurple.shade300 : widget.buttonColor,
      borderRadius: BorderRadius.circular(25.0),
      child: InkWell(
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        onTap: () {
          setState(() {
            _isPressed = false;
          });
          // Add your button's pressed logic comes here.
          widget.whenPressed();
        },
        borderRadius: BorderRadius.circular(25.0),
        child: Container( height: 50,width: widget.buttonWidth,
          constraints: const BoxConstraints(minWidth: 0, minHeight: 50),
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style:const  TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

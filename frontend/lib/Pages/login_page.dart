import 'package:flutter/material.dart';
import 'package:nucleus/src/main_button.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 7, 15, 1),
      body: Stack(
        children: [
          const Align(
              alignment: Alignment.bottomCenter,
              child: MainButton(
                title: 'Book a journey!',
              )),
          const Positioned(
            top: -180,
            left: -150,
            right: 70,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/earth.png'),
            ),
          ),
          Center(
            child: GlassmorphicContainer(
              height: 250,
              linearGradient: LinearGradient(
                colors: [
                 const Color(0xFFffffff).withOpacity(0.1),
                 const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
              ),
              width: 340,
              blur: 10,
              border: 2,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                 const Color(0xFFffffff).withOpacity(0.2),
                 const Color(0xFFFFFFFF).withOpacity(0.2),
                ],
              ),
              borderRadius: 20,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

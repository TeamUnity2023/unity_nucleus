import 'package:flutter/material.dart';
import 'package:nucleus/src/main_button.dart';
import 'package:nucleus/src/back_button.dart';
import 'package:glassmorphism/glassmorphism.dart';

//This is a preview. This will be modularized later via adding parameters so that this can be used easily for any planet.
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 7, 15, 1),
      body: Stack(
        children: [
          //add back button from back_button.dart
          const Positioned(
            top: 5,
            left: 5,
            child: CustomBackButton(
              title: '  <  ',
            ),
          ),
          Positioned(
            top: 70,
            left: 70, 
            right: 70,
            child: GlassmorphicContainer(
              height: 400,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
              ),
              width: 250,
              blur: 20,
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
              
            ),
          ),
          const Positioned(
            top: 70,
            left: 70,
            right: 70,
            child: Image(
              image: AssetImage('assets/images/earth.png'),
            ),
          ),
        ],
      ),
    );
  }
}

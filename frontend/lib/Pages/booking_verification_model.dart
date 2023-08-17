import 'package:flutter/material.dart';
import 'package:nucleus/src/main_button.dart';
import 'package:nucleus/src/back_button.dart';
import 'package:glassmorphism/glassmorphism.dart';

class VerificationScreen extends StatefulWidget {

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  
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
              border: 2, borderRadius: 20,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.2),
                  const Color(0xFFFFFFFF).withOpacity(0.2),
                ],
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 70,
            right: 70,
            child: GlassmorphicContainer(
              height: 200,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
              ),
              width: 250,
              blur: 20,
              border: 2, borderRadius: 20,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.2),
                  const Color(0xFFFFFFFF).withOpacity(0.2),
                ],
              ),
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
          //text saying enter otp. text should be white and bold
          const Positioned(
            top: 500,
            left: 120,
            right: 120,
            child: Text(
              'Enter OTP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 550,
            left: 70,
            right: 70,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          //add timer clock of format mm:ss with working countdown from 2 minutes
          
          
          

        ],
      ),
    );
  }
}

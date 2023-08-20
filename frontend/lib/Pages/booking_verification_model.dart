import 'dart:async';
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
  late Timer _timer;
  int _remainingSeconds = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              borderRadius: 20,
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
              border: 2,
              borderRadius: 20,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.2),
                  const Color(0xFFFFFFFF).withOpacity(0.2),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Expanded(
                        child: Text(
                      'Earth',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Population :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                    SizedBox(
                      height: 9,
                    ),
                    Expanded(
                        child: Text(
                      'Cost :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                  ],
                ),
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
          Positioned(
            top: 620,
            left: 170,
            child: Text(
              _formatTime(_remainingSeconds),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 70,
            right: 70,
            child: MainButton(
              whenPressed: () {
                /*Instead pass what needs to be done*/
              },
              title: 'Verify',
            ),
          ),
          const Positioned(
            top: 710,
            left: 150,
            child: Text(
              'Resend OTP',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}

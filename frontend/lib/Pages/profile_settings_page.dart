import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../src/main_button.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: [
          Image.asset(
            'assets/images/background1.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(7, 7, 15, 0.7),
            colorBlendMode: BlendMode.hardLight,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),




              GlassmorphicContainer(
                height: 500,
                linearGradient: LinearGradient(
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.3),
                    const Color(0xFFFFFFFF).withOpacity(0.1),
                  ],
                ),
                width: 340,
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Date of birth :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Travel Plan :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),


                    ],
                  ),
                ),
              ),



















              // Button to edit the user's information
              Center(
                child: MainButton(
                  title: 'Save Changes',
                  buttonWidth: 250,
                  whenPressed: () {
                    // Add your onPressed code here!
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

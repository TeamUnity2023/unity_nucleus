import 'package:flutter/material.dart';
import 'package:nucleus/Pages/profile_settings_page.dart';
import '../src/back_button.dart';
import '../src/main_button.dart';

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({super.key});

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
          const Positioned(
            top: 5,
            left: 5,
            child: CustomBackButton(
              title: '  <  ',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFieldWithSubtext('Name', 'David Anderson'),
                    _buildFieldWithSubtext('Date of birth', 'January 1, 1990'),
                    _buildFieldWithSubtext('Universal ID', '123456'),
                    _buildFieldWithSubtext('Universal Travel ID', '987654'),
                    _buildFieldWithSubtext('Travel plan', 'Luxury'),
                  ],
                ),
              ),
              // Button to edit the user's information
              Center(
                child: MainButton(
                  title: 'Edit',
                  buttonWidth: 150,
                  whenPressed: () {
                    // Add your onPressed code here!
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ProfileSettings(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldWithSubtext(String fieldText, String subText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$fieldText :',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          subText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18, // You can adjust the font size for the subtext
          ),
        ),
        // Adding spacing between fields
        const SizedBox(height: 30),
      ],
    );
  }
}

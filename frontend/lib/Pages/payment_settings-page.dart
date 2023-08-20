import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nucleus/Pages/profile_preview_page.dart';
import '../src/back_button.dart';
import '../src/main_button.dart';

class PaymentSettings extends StatefulWidget {
  const PaymentSettings({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentSettingsState createState() => _PaymentSettingsState();
}

class _PaymentSettingsState extends State<PaymentSettings> {
  DateTime selectedDate =
      DateTime.now(); // Declare selectedDate as non-nullable DateTime

  String? selectedTravelPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
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
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GlassmorphicContainer(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 75),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Universal Travel ID :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '1270-2039-1320-1423M',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Card Number :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter
                                    .digitsOnly // Only numbers are allowed
                              ],
                              decoration: const InputDecoration(
                                hintText: 'Enter your Card Number',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Travel Type :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DropdownButton<String>(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              dropdownColor: Colors.deepPurple.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),

                              iconSize: 40,
                              items: const [
                                DropdownMenuItem(
                                    value: 'Economy', child: Text('Economy')),
                                DropdownMenuItem(
                                    value: 'General', child: Text('General')),
                                DropdownMenuItem(
                                    value: 'Luxury', child: Text('Luxury')),
                                DropdownMenuItem(
                                    value: 'Super Luxury',
                                    child: Text('Super Luxury')),
                              ],
                              onChanged: (String? value) {
                                // Handle dropdown value change
                                setState(() {
                                  selectedTravelPlan = value;
                                });
                              },
                              hint: const Text(
                                'Select travel type',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              isExpanded: true,
                              value:
                                  selectedTravelPlan, // Set the selected value
                            ),
                          ),
                        ], // Missing closing bracket for the Column's children
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MainButton(
                  title: 'Save Changes',
                  buttonWidth: 250,
                  whenPressed: () {
                    // Add your onPressed code here!
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ProfilePreview(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

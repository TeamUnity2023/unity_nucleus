import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../src/back_button.dart';
import '../src/main_button.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  DateTime selectedDate =
      DateTime.now(); // Declare selectedDate as non-nullable DateTime

  String? selectedTravelPlan;

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
          ),  const Positioned(
            top: 5,
            left: 5,
            child: CustomBackButton(
              title: '  <  ',
            ),
          ),
          SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Align(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),

                const SizedBox(height: 20),
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
                            'Name :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Date of Birth :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20), // Circular corner radius
                                    ),
                                    backgroundColor: Colors.deepPurple,
                                    child: Theme(
                                      data: ThemeData.dark().copyWith(
                                        primaryColor: Colors.deepPurple,
                                        colorScheme: const ColorScheme.dark().copyWith(
                                          primary: Colors.black,
                                          onPrimary: Colors.white,
                                          surface: Colors.deepPurple,
                                        ),
                                        buttonTheme: const ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: CalendarDatePicker(
                                          initialDate: selectedDate,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                          onDateChanged: (DateTime newDate) {
                                            Navigator.of(context).pop(newDate);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                hintText: 'Select date of birth',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              child: Text(
                                selectedDate.toString().substring(0, 10),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
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
                          DropdownButton<String>(
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            isExpanded: true,
                            value: selectedTravelPlan, // Set the selected value
                          ),
                        ], // Missing closing bracket for the Column's children
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: MainButton(
                    title: 'Save Changes',
                    buttonWidth: 250,
                    whenPressed: () {
                      // Add your onPressed code here!
                    },
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../models/Planet.dart';
import '../src/back_button.dart';
import '../src/main_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DateTime selectedDate =
  DateTime.now(); // Declare selectedDate as non-nullable DateTime

  String? selectedTravelPlan;
  // selected departure planet
  Object? selectedDeparturePlanet;
  // selected arrival planet
  Object? selectedArrivalPlanet;

  late List<Planet> planets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( alignment: Alignment.center,
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
          FutureBuilder(builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return SingleChildScrollView(
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
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Departure Planet:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // open dialog that allows user to
                                          // select a planet from a list view
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              title: const Text('Select a planet'),
                                              content: Container(
                                                width: double.maxFinite,
                                                height: double.maxFinite,
                                                child: ListView(
                                                  children:
                                                  <Object>["Mercury", "Venus"].map<Widget>(
                                                          (Object value) => GestureDetector(
                                                        onTap: (){
                                                          // select the planet and close the dialog
                                                          setState(() {
                                                            selectedDeparturePlanet = value;
                                                          });
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: ListTile(
                                                          title: Text(value as String),
                                                        ),
                                                      )
                                                  ).toList(),
                                                ),
                                              ),
                                            );
                                          });

                                        },
                                        child: const Text('Select Planet'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if(selectedDeparturePlanet != null) Text(
                                    '${selectedDeparturePlanet.toString().split(" ")[0]}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  const Text(
                                    'Arrival Planet:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // open dialog that allows user to
                                      // select a planet from a list view
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: const Text('Select a planet'),
                                          content: Container(
                                            width: double.maxFinite,
                                            height: double.maxFinite,
                                            child: ListView(
                                              children: const [
                                                ListTile(
                                                  title: Text('Mercury'),
                                                ),
                                                ListTile(
                                                  title: Text('Venus'),
                                                ),
                                                ListTile(
                                                  title: Text('Earth'),
                                                ),
                                                ListTile(
                                                  title: Text('Mars'),
                                                ),
                                                ListTile(
                                                  title: Text('Jupiter'),
                                                ),
                                                ListTile(
                                                  title: Text('Saturn'),
                                                ),
                                                ListTile(
                                                  title: Text('Uranus'),
                                                ),
                                                ListTile(
                                                  title: Text('Neptune'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });

                                    },
                                    child: const Text('Select Planet'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Departure Date picker
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Departure Date:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // open dialog that allows user to
                                          // select a date from a date picker
                                          showDatePicker(
                                            context: context,
                                            initialDate: selectedDate, // Refer step 1
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2025),
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Theme(
                                                data: ThemeData.dark().copyWith(
                                                  colorScheme: const ColorScheme.dark(
                                                    primary: Colors.deepPurple,
                                                    onPrimary: Colors.white,
                                                    surface: Colors.deepPurple,
                                                    onSurface: Colors.white,
                                                  ),
                                                  dialogBackgroundColor:
                                                  Colors.deepPurple.withOpacity(0.9),
                                                ),
                                                child: child!,
                                              );
                                            },
                                          ).then((date) {
                                            setState(() {
                                              selectedDate = date!;
                                            });
                                          });
                                        },
                                        child: const Text('Select Date'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${selectedDate.toString().split(" ")[0]}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Travel Type :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left : 10),
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
                                        style:
                                        TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      isExpanded: true,
                                      value: selectedTravelPlan, // Set the selected value
                                    ),
                                  ),
                                ],
                              ),
                            ], // Missing closing bracket for the Column's children
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      title: 'Search',
                      buttonWidth: 250,
                      whenPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }),
        ],
      ),
    );
  }
}

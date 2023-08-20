import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nucleus/Pages/search_results_page.dart';
import 'package:nucleus/api/locations_api.dart';
import '../models/planet.dart';
import '../src/back_button.dart';
import '../src/main_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class FlightSearch{
  Planet? departurePlanet;
  Planet? arrivalPlanet;
  DateTime? departureDate;
  String? travelType;

  FlightSearch({this.departurePlanet, this.arrivalPlanet, this.departureDate, this.travelType});
}

class _SearchPageState extends State<SearchPage> {
  DateTime selectedDate = DateTime.utc(
      2138, 01, 01); // Declare selectedDate as non-nullable DateTime

  String? selectedTravelPlan;

  late List<Planet> planets;
  late List<Planet> filteredDeparturePlanets;
  late List<Planet> filteredArrivalPlanets;
  Planet? selectedDeparturePlanet;
  Planet? selectedArrivalPlanet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background2.jpg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(7, 7, 15, 0.8),
            colorBlendMode: BlendMode.hardLight,
          ),
          const Positioned(
            top: 5,
            left: 5,
            child: CustomBackButton(
              title: '  <  ',
            ),
          ),
          FutureBuilder(
            future: LocationsApi().getLocations(),
              builder: (_, snap){
            if(snap.connectionState == ConnectionState.done && snap.hasData){
              planets = snap.data as List<Planet>;
              filteredDeparturePlanets = planets;
              filteredArrivalPlanets = planets;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Departure :',
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
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return buildAlertDialog(context, filteredDeparturePlanets, (Planet planet){
                                            setState(() {
                                              selectedDeparturePlanet = planet;
                                            });
                                          });
                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child:  const Text('Select Planet'),
                                ),

                              ],
                            ),
                            if(selectedDeparturePlanet != null)
                              buildPlanetTile(selectedDeparturePlanet!),
                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Destination :',
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
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return buildAlertDialog(context, filteredArrivalPlanets, (Planet planet){
                                            setState(() {
                                              selectedArrivalPlanet = planet;
                                            });
                                          });
                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child:  const Text('Select Planet'),
                                ),
                              ],
                            ),
                            if(selectedArrivalPlanet != null) buildPlanetTile(selectedArrivalPlanet!),
                            const SizedBox(height: 20),
                            const Text(
                              'Date of Departure :',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left : 10),
                              child: InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20), // Circular corner radius
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                        child: Theme(
                                          data: ThemeData.dark().copyWith(
                                            primaryColor: Colors.deepPurple,
                                            colorScheme:
                                            const ColorScheme.dark().copyWith(
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
                                              firstDate: DateTime(2050),
                                              lastDate: DateTime.utc(2160, 12, 31),
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
                                    hintText: 'Select date of Departure',
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
                          ], // Missing closing bracket for the Column's children
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchResultsPage(FlightSearch(
                                departurePlanet: selectedDeparturePlanet,
                                arrivalPlanet: selectedArrivalPlanet,
                                departureDate: selectedDate,
                                travelType: selectedTravelPlan,
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ],
      ),
    );
  }

  Widget buildPlanetTile(Planet planet) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        planet.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context, List<Planet> planetList, Null Function(Planet planet) setPlanet) {
    return AlertDialog(backgroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20),
      ),
      title: const Padding(
        padding:EdgeInsets.all(15.0),
        child:  Text('Select a planet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context)
            .size
            .height *
            0.4,
        child: ListView( scrollDirection: Axis.vertical,
          children: planetList
              .map<Widget>((Planet value) =>
              GestureDetector(
                onTap: () {
                  // select the planet and close the dialog
                  setPlanet(value);
                  Navigator.of(context)
                      .pop();
                },
                child: ListTile(
                  title: Text(
                      value.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                  ),
                ),
              ))
              .toList(),
        ),
      ),
    );
  }
}

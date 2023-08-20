import 'package:flutter/material.dart';
import 'package:nucleus/src/back_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../src/result_list_tile.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, String>> searchResults = [
    {
      'departureImage': 'assets/departure_planet_1.png',
      'destinationImage': 'assets/destination_planet_1.png',
      'transitInfo': 'Transit A',
    },
    {
      'departureImage': 'assets/departure_planet_2.png',
      'destinationImage': 'assets/destination_planet_2.png',
      'transitInfo': 'Transit B',
    },
    // Add more search result items... from JSON data
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return SearchResultItem(
            departureImage: searchResults[index]['departureImage']!,
            destinationImage: searchResults[index]['destinationImage']!,
            transitInfo: searchResults[index]['transitInfo']!,
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SearchPage()));
}

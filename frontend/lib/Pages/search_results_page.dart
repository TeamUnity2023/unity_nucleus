import 'package:flutter/material.dart';
import 'package:nucleus/Pages/search_page.dart';
import 'package:nucleus/api/search_api.dart';
import '../src/back_button.dart';
import '../src/result_list_tile.dart';

class SearchResultsPage extends StatefulWidget {
  FlightSearch flightSearch;

  SearchResultsPage(this.flightSearch, {super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class FlightSearchResult{
  final String departureImage;
  final String destinationImage;
  final String transitInfo;
  final String departurePlanetName;
  final String destinationPlanetName;

  FlightSearchResult({
    required this.departureImage,
    required this.destinationImage,
    required this.transitInfo,
    required this.departurePlanetName,
    required this.destinationPlanetName,
  });
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  // Mock search results data

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        'assets/images/background1.jpg', // Replace with your image path
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(7, 7, 15, 0.7),
        colorBlendMode: BlendMode.hardLight,
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: CustomBackButton(
                title: '  <  ',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: FlightSearchApi().getSearchResults(widget.flightSearch),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final searchResults = snapshot.data as List<FlightSearchResult>;
                return ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return SearchResultItem(
                      departureImage: searchResults[index].departureImage,
                      destinationImage: searchResults[index].destinationImage,
                      transitInfo: searchResults[index].transitInfo,
                      departurePlanetName: searchResults[index].departurePlanetName,
                      destinationPlanetName: searchResults[index].destinationPlanetName,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ]);
  }
}


import 'dart:convert';
import 'dart:html';

import 'package:json_annotation/json_annotation.dart';
import 'package:nucleus/Pages/search_page.dart';

import '../Pages/search_results_page.dart';

part 'search_api.g.dart';

class FlightSearchApi{
  String baseUrl = 'http://127.0.0.1:8000/api';
  String endpoint = '/search';

  Future<List<FlightSearchResult>> getSearchResults(FlightSearch searchData) async {
    // make http request to get locations
    // return list of locations
    HttpRequest request = await HttpRequest.request(
      baseUrl + endpoint,
      method: 'POST',
      sendData: {
        'departure_location': searchData.departurePlanet!.id,
        'destination_location': searchData.arrivalPlanet!.id,
        "departure_date": "2160-01-09",
        "travel_plan": 1
      },
    );
    // convert response to list of Planet objects
    List<dynamic> list = jsonDecode(request.response);

    // print type of list
    List<FlightSearchApiResult> apiResults = [];
    for (var item in list){
      apiResults.add(FlightSearchApiResult.fromJson(item));
    }

    List<FlightSearchResult> searchResults = [];

    return searchResults;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FlightSearchApiResult{
  List<int> flights;
  double price;

  FlightSearchApiResult({
    required this.flights,
    required this.price,
  });

  factory FlightSearchApiResult.fromJson(Map<String, dynamic> json) => _$FlightSearchApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$FlightSearchApiResultToJson(this);
}
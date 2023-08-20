import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import '../models/planet.dart';

class LocationsApi{
  String baseUrl = 'http://127.0.0.1:8000/api';
  String endpoint = '/locations';

  Future<List<Planet>> getLocations() async {
    // make http request to get locations
    // return list of locations
    HttpRequest request = await HttpRequest.request(
      baseUrl + endpoint,
      method: 'GET',
    );
    // convert response to list of Planet objects
    List<dynamic> list = jsonDecode(request.response);

    // print type of list
    List<Planet> planets = [];
    for (var item in list){
      debugPrint(item.toString());
      planets.add(Planet.fromJson(item));
    }
    return planets;
  }
}
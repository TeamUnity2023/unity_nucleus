import 'dart:html';

import 'package:flutter/material.dart';

import '../models/planet.dart';

class LocationsApi{
  String baseUrl = 'http://localhost:8000/api';
  String endpoint = '/locations';

  Future<List<Planet>> getLocations() async {
    // make http request to get locations
    // return list of locations
    HttpRequest request = await HttpRequest.request(
      baseUrl + endpoint,
      method: 'GET',
    );

    debugPrint(request.response);

    Future.delayed(Duration(seconds: 2));
    return [
      Planet(id: "1", name: "Earth", image: "")
    ];
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightSearchApiResult _$FlightSearchApiResultFromJson(
        Map<String, dynamic> json) =>
    FlightSearchApiResult(
      flights: (json['flights'] as List<dynamic>).map((e) => e as int).toList(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$FlightSearchApiResultToJson(
        FlightSearchApiResult instance) =>
    <String, dynamic>{
      'flights': instance.flights,
      'price': instance.price,
    };

import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Planet{
  String id;
  String name;
  String image;
  String? description;

  Planet({
    required this.id,
    required this.name,
    required this.image,
    this.description,
  });

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}
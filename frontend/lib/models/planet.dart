import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Planet{
  int id;
  String name;
  String picture;
  String? description;

  Planet({
    required this.id,
    required this.name,
    required this.picture,
    this.description,
  });

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}
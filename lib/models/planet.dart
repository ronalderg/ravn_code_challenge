import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
part 'planet.g.dart';

PlanetData PlanetDataFromJson(String str) => PlanetData.fromJson(json.decode(str));

String PlanetDataToJson(PlanetData data) => json.encode(data.toJson());

class PlanetData {
  PlanetData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  String? next;
  String? previous;
  List<Planet> results;

  factory PlanetData.fromJson(Map<String, dynamic> json) => PlanetData(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Planet>.from(json["results"].map((x) => Planet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class Planet extends Equatable{
  Planet({
    required this.id,
    required this.name,
    this.rotation_period,
    this.orbital_period,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    this.surface_water,
    this.population,
    this.created,
    this.edited,
    this.url,
  });

  int id;
  String name;
  String? rotation_period;
  String? orbital_period;
  String? diameter;
  String? climate;
  String? gravity;
  String? terrain;
  String? surface_water;
  String? population;
  DateTime? created;
  DateTime? edited;
  String? url;

  factory Planet.fromJson(Map<String, dynamic> json) =>
      _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);

  @override
  List<Object?> get props => [
    name,
    rotation_period,
    orbital_period,
    diameter,
    climate,
    gravity,
    terrain,
    surface_water,
    population,
    created,
    edited,
    url,
  ];

}

/*
Planet _$PlanetFromJson(Map<String, dynamic> json) {
      int idUrl = int.parse(json['url'].toString().split('/').last);
  return Planet(
    id: idUrl,
    name: json['name'] as String,
    rotation_period: json['rotation_period'] as String?,
    orbital_period: json['orbital_period'] as String?,
    diameter: json['diameter'] as String?,
    climate: json['climate'] as String?,
    gravity: json['gravity'] as String?,
    terrain: json['terrain'] as String?,
    surface_water: json['surface_water'] as String?,
    population: json['population'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    edited: json['edited'] == null
        ? null
        : DateTime.parse(json['edited'] as String),
    url: json['url'] as String?,
  );
}
 */
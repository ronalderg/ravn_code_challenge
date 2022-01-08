import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'people.g.dart';

PeopleData peopleDataFromJson(String str) => PeopleData.fromJson(json.decode(str));

String peopleDataToJson(PeopleData data) => json.encode(data.toJson());

class PeopleData {
  PeopleData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  String? next;
  String? previous;
  List<People> results;

  factory PeopleData.fromJson(Map<String, dynamic> json) => PeopleData(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<People>.from(json["results"].map((x) => People.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class People extends Equatable{
  People({

    required this.name,
    this.height,
    this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.created,
    this.edited,
    this.url,
    required this.starships
  });

  String name;
  String? height;
  String? mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String? gender;
  String? homeworld;
  List<String>? films;
  List<String>? species;
  List<String>? vehicles;
  List<String>? starships;
  DateTime? created;
  DateTime? edited;
  String? url;

  factory People.fromJson(Map<String, dynamic> json) =>
      _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

  @override
  List<Object?> get props => [
    name,
    height,
    mass,
    hairColor,
    skinColor,
    eyeColor,
    birthYear,
    gender,
    homeworld,
    films,
    species,
    vehicles,
    starships,
    created,
    edited,
    url
  ];

}





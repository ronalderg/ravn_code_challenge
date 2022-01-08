import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'specie.g.dart';

SpecieData SpecieDataFromJson(String str) => SpecieData.fromJson(json.decode(str));

String SpecieDataToJson(SpecieData data) => json.encode(data.toJson());

class SpecieData {
  SpecieData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  String? next;
  String? previous;
  List<Specie> results;

  factory SpecieData.fromJson(Map<String, dynamic> json) => SpecieData(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Specie>.from(json["results"].map((x) => Specie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

@JsonSerializable()
class Specie extends Equatable{
  Specie({
    required this.id,
    required this.name,
    this.classification,
    this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.homeworld,
    this.language,
    this.created,
    this.edited
  });

  int id;
  String name;
  String? classification;
  String? designation;
  String? averageHeight;
  String? skinColors;
  String? hairColors;
  String? eyeColors;
  String? averageLifespan;
  String? homeworld;
  String? language;
  DateTime? created;
  DateTime? edited;
  String? url;

  factory Specie.fromJson(Map<String, dynamic> json) =>
      _$SpecieFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieToJson(this);

  @override
  List<Object?> get props => [

  ];

}
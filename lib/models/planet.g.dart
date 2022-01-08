// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  List<String> urlSplit = json['url'].split('/');
  urlSplit.removeLast();
  int idUrl = int.parse(urlSplit.last);
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

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rotation_period': instance.rotation_period,
      'orbital_period': instance.orbital_period,
      'diameter': instance.diameter,
      'climate': instance.climate,
      'gravity': instance.gravity,
      'terrain': instance.terrain,
      'surface_water': instance.surface_water,
      'population': instance.population,
      'created': instance.created?.toIso8601String(),
      'edited': instance.edited?.toIso8601String(),
      'url': instance.url,
    };

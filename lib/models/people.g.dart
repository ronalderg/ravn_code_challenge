// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      name: json['name'] as String,
      height: json['height'] as String?,
      mass: json['mass'] as String?,
      hairColor: json['hair_color'] as String,
      skinColor: json['skin_color'] as String,
      eyeColor: json['eye_color'] as String,
      birthYear: json['birth_year'] as String,
      gender: json['gender'] as String?,
      homeworld: json['homeworld'] as String?,
      films:
            (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      species:
            (json['species'] as List<dynamic>).map((e) => e as String).toList(),
      vehicles:
            (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      edited: json['edited'] == null
          ? null
          : DateTime.parse(json['edited'] as String),
      url: json['url'] as String?,
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'hair_color': instance.hairColor,
      'skin_color': instance.skinColor,
      'eye_color': instance.eyeColor,
      'birth_year': instance.birthYear,
      'gender': instance.gender,
      'homeworld': instance.homeworld,
      'starships': instance.starships,
      'created': instance.created?.toIso8601String(),
      'edited': instance.edited?.toIso8601String(),
      'url': instance.url,
    };

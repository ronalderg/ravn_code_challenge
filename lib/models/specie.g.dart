// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map<String, dynamic> json) {
      List<String> urlSplit = json['url'].split('/');
      urlSplit.removeLast();
      int idUrl = int.parse(urlSplit.last);
      return Specie(
            id: idUrl,
            name: json['name'] as String,
            classification: json['classification'] as String?,
            designation: json['designation'] as String?,
            averageHeight: json['average_height'] as String?,
            skinColors: json['skin_colors'] as String?,
            hairColors: json['hair_colors'] as String?,
            eyeColors: json['eye_colors'] as String?,
            averageLifespan: json['average_lifespan'] as String?,
            homeworld: json['homeworld'] as String?,
            language: json['language'] as String?,
            created: json['created'] == null
                ? null
                : DateTime.parse(json['created'] as String),
            edited: json['edited'] == null
                ? null
                : DateTime.parse(json['edited'] as String),
      )
            ..url = json['url'] as String?;
}

Map<String, dynamic> _$SpecieToJson(Specie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'averageHeight': instance.averageHeight,
      'skinColors': instance.skinColors,
      'hairColors': instance.hairColors,
      'eyeColor': instance.eyeColors,
      'averageLifespan': instance.averageLifespan,
      'homeworld': instance.homeworld,
      'language': instance.language,
      'created': instance.created?.toIso8601String(),
      'edited': instance.edited?.toIso8601String(),
      'url': instance.url,
};


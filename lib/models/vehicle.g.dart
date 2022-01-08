// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      name: json['name'] as String,
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      costInCredits: json['cost_in_credits'] as String,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String,
      crew: json['crew'] as String,
      passengers: json['passengers'] as String,
      cargoCapacity: json['cargo_capacity'] as String?,
      consumables: json['consumables'] as String?,
      vehicleClass: json['vehicle_class'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      edited: json['edited'] == null
          ? null
          : DateTime.parse(json['edited'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'cost_in_credits': instance.costInCredits,
      'max_atmosphering_speed': instance.maxAtmospheringSpeed,
      'crew': instance.crew,
      'passengers': instance.passengers,
      'cargo_capacity': instance.cargoCapacity,
      'consumables': instance.consumables,
      'vehicle_class': instance.vehicleClass,
      'created': instance.created?.toIso8601String(),
      'edited': instance.edited?.toIso8601String(),
      'url': instance.url,
    };

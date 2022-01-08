import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Equatable{
  Vehicle({

    required this.name,
    this.model,
    this.manufacturer,
    this.costInCredits,
    this.maxAtmospheringSpeed,
    this.crew,
    this.passengers,
    this.cargoCapacity,
    this.consumables,
    this.vehicleClass,
    this.created,
    this.edited,
    this.url
  });

  String name;
  String? model;
  String? manufacturer;
  String? costInCredits;
  String? maxAtmospheringSpeed;
  String? crew;
  String? passengers;
  String? cargoCapacity;
  String? consumables;
  String? vehicleClass;
  DateTime? created;
  DateTime? edited;
  String? url;


  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @override
  List<Object?> get props => [
    name,
    model,
    manufacturer,
    costInCredits,
    maxAtmospheringSpeed,
    crew,
    passengers,
    cargoCapacity,
    consumables,
    vehicleClass,
    created,
    edited,
    url
  ];

}
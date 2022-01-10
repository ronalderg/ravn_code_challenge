import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_code_challenge/models/people.dart';
import 'package:ravn_code_challenge/models/vehicle.dart';
import 'package:ravn_code_challenge/services/rest_api.dart';

void main(){
  group('Test for API REST implementation', (){
    //TEST FOR PEOPLE API
    test("Test api rest to get people with a existing page", () async {
      PeopleData? data = await RestApi.fetchPeople(currentPage: 3);
      //Then
      expect(data is PeopleData, true);
    });
    test("Test api rest to get people with a non existent page", () async {
      PeopleData? data = await RestApi.fetchPeople(currentPage: 7);
      //Then
      expect(data is PeopleData, true);
    });

    //TEST FOR PLANETS API
    test("Test api rest implementation to get all planets as Map", () async {
      Map<String, dynamic> planets = await RestApi.fetchPlanets();
      //Then
      expect(planets.isNotEmpty, true);
    });

    //TEST FOR SPECIES API
    test("Test api rest implementation to get all species as Map", () async {
      Map<String, dynamic> species = await RestApi.fetchSpecies();
      //Then
      expect(species.isNotEmpty, true);
    });

    //TEST FOR VEHICLES API
    test("Test api rest implementation to get vehicles in ", () async {
      List<String> urlVehicles = ['https://swapi.dev/api/vehicles/6/',
        'https://swapi.dev/api/vehicles/7/'];
      List<Vehicle> vehicles = await RestApi.getVehiclesOfPeople(urlVehicles: urlVehicles);
      //Then
      expect(vehicles.isNotEmpty, true);
    });
  });
}
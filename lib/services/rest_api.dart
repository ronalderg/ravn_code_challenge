import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ravn_code_challenge/models/people.dart';
import 'package:ravn_code_challenge/models/planet.dart';
import 'package:ravn_code_challenge/models/specie.dart';
import 'package:ravn_code_challenge/models/vehicle.dart';

class URLS {
  static const String apiUrl = 'https://swapi.dev/api';
}

class RestApi {
  static Future<PeopleData?> fetchPeople({int currentPage=1}) async {
    final Uri url = Uri.parse('${URLS.apiUrl}/people?page=$currentPage&size=10');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      return peopleDataFromJson(body);
    } else {
      return null;
    }
  }

  static Future<List<Vehicle>> getVehiclesOfPeople({required List<String> urlVehicles}) async {
    List<Vehicle> vehiclesResult = [];
    for(String urlVehicle in urlVehicles){
      Uri url = Uri.parse(urlVehicle);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        vehiclesResult.add(Vehicle.fromJson(json.decode(response.body)));
      }
    }
    return vehiclesResult;
  }

  static Future<Map<String, dynamic>> fetchPlanets() async {
    Map<String, dynamic> planetsResult = {};
    int currentPage = 1;
    int maxPages = 1;
    do{
      final Uri url = Uri.parse('${URLS.apiUrl}/planets?page=$currentPage&size=10');
      final response = await http.get(url).timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        final planets = PlanetData.fromJson(json.decode(response.body));
        if(currentPage==1) {
          maxPages = (planets.count/10).round();
        }
        for(Planet planet in planets.results){
          planetsResult['${planet.id}'] = planet;
        }
      }
      else{
        throw Exception('Error in api rest ${response.statusCode}');
      }
      currentPage++;
    }while(currentPage<=maxPages);
    return planetsResult;
  }

  static Future<Map<String, dynamic>> fetchSpecies() async {
    Map<String, dynamic> speciesResult = {};
    int currentPage = 1;
    int maxPages = 1;
    do{
      final Uri url = Uri.parse('${URLS.apiUrl}/species?page=$currentPage&size=10');
      final response = await http.get(url).timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        final species = SpecieData.fromJson(json.decode(response.body));
        if(currentPage==1) {
          maxPages = (species.count/10).round();
        }
        for(Specie specie in species.results){
          speciesResult['${specie.id}'] = specie;
        }
      }
      else{
        throw Exception('Error in api rest ${response.statusCode}');
      }
      currentPage++;
    }while(currentPage<=maxPages);
    return speciesResult;
  }

}
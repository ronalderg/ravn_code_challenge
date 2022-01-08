import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/pages/people_of_star_wars.dart';
import 'package:ravn_code_challenge/routes/route_names.dart';
import 'package:ravn_code_challenge/services/rest_api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    getUniversalData();
  }

  Future<void> getUniversalData() async {
    Map<String, dynamic> planets = await RestApi.fetchPlanets();
    Map<String, dynamic> species = await RestApi.fetchSpecies();
    if(species.isNotEmpty && planets.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) =>
              PeopleOfStarWars(planets: planets, species: species,)),
          ModalRoute.withName('/')
      );
    }
    else
      {

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/starwars-animation.gif",
              // height: 125.0,
              // width: 125.0,
            ),
            const LinearProgressIndicator(color: Colors.amber),
            const SizedBox(height: 10,),
            const Text('Loading universal data...', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

          ],
        ),
      )
    );
  }
}

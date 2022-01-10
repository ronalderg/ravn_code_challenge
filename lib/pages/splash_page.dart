import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/constants/assets_images.dart';
import 'package:ravn_code_challenge/generated/l10n.dart';
import 'package:ravn_code_challenge/pages/people_of_star_wars_page.dart';
import 'package:ravn_code_challenge/services/rest_api.dart';

/// Splash page - geting species and planets data from api while it's showing
/// the splash page
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  String _descriptionText = '${S.current.loadingUniverseData}...';
  @override
  void initState() {
    super.initState();
    getUniversalData();
  }

  Future<void> getUniversalData() async {
    try{
      Map<String, dynamic> planets = await RestApi.fetchPlanets();
      Map<String, dynamic> species = await RestApi.fetchSpecies();
      if(species.isNotEmpty && planets.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) =>
                PeopleOfStarWarsPage(planets: planets, species: species,)
            ),
            ModalRoute.withName('/')
        );
      }
      else
      {
        _descriptionText = S.current.errorLoadingData;
      }
    }catch(e){
      _descriptionText = S.current.errorLoadingData;
    }
    setState(() {
      _descriptionText;
    });
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
            Image.asset(AssetsImages.splashAnimation),
            const LinearProgressIndicator(color: Colors.amber),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(_descriptionText, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
          ],
        ),
      )
    );
  }
}

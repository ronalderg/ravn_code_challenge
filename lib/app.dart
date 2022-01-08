import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ravn_code_challenge/pages/people_of_star_wars.dart';
import 'package:ravn_code_challenge/pages/splash.dart';
import 'package:ravn_code_challenge/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter APP ',
      theme: ThemeData(
        // brightness: Brightness.dark,
        // // primarySwatch: Colors.grey,
        // primaryColor: Colors.black,
        // //colorScheme: Colors.black,
        // canvasColor: Colors.white
      ),
      home: const SplashScreen(),
      routes: appRoutes,
    );
  }
}
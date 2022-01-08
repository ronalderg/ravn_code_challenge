import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/pages/detail_people.dart';
import 'package:ravn_code_challenge/pages/people_of_star_wars.dart';
import 'package:ravn_code_challenge/pages/splash.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'people_of_star_wars': (_) => PeopleOfStarWars(),
  'splash': (_) => SplashScreen(),
  'detail_people': (_) => DetailPeople(),
};
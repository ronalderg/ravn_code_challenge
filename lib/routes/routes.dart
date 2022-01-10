import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/pages/person_detail_page.dart';
import 'package:ravn_code_challenge/pages/language_selector_page.dart';
import 'package:ravn_code_challenge/pages/people_of_star_wars_page.dart';
import 'package:ravn_code_challenge/pages/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'people_of_star_wars': (_) => PeopleOfStarWarsPage(),
  'splash': (_) => const SplashPage(),
  'detail_people': (_) => PersonDetailPage(),
  'language_selector': (_) => const LanguageSelectorPage()
};
// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `People of star wars`
  String get peopleOfStarWars {
    return Intl.message(
      'People of star wars',
      name: 'peopleOfStarWars',
      desc: '',
      args: [],
    );
  }

  /// `Human`
  String get human {
    return Intl.message(
      'Human',
      name: 'human',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Loading universe data`
  String get loadingUniverseData {
    return Intl.message(
      'Loading universe data',
      name: 'loadingUniverseData',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get generalInformation {
    return Intl.message(
      'General Information',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Eye Color`
  String get eyeColor {
    return Intl.message(
      'Eye Color',
      name: 'eyeColor',
      desc: '',
      args: [],
    );
  }

  /// `Hair Color`
  String get hairColor {
    return Intl.message(
      'Hair Color',
      name: 'hairColor',
      desc: '',
      args: [],
    );
  }

  /// `Skin Color`
  String get skinColor {
    return Intl.message(
      'Skin Color',
      name: 'skinColor',
      desc: '',
      args: [],
    );
  }

  /// `Birth Year`
  String get birthYear {
    return Intl.message(
      'Birth Year',
      name: 'birthYear',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles`
  String get vehicles {
    return Intl.message(
      'Vehicles',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Load Data`
  String get failedToLoadData {
    return Intl.message(
      'Failed to Load Data',
      name: 'failedToLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Press Back button again to Exit`
  String get pressBackButtonAgainToExit {
    return Intl.message(
      'Press Back button again to Exit',
      name: 'pressBackButtonAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Select a language`
  String get selectALanguage {
    return Intl.message(
      'Select a language',
      name: 'selectALanguage',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading data, try to restart app or verify your internet connection`
  String get errorLoadingData {
    return Intl.message(
      'Error Loading data, try to restart app or verify your internet connection',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

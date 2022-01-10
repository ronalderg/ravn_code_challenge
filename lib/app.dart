import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ravn_code_challenge/generated/l10n.dart';
import 'package:ravn_code_challenge/pages/language_selector_page.dart';
import 'package:ravn_code_challenge/provider/locale_provider.dart';
import 'package:ravn_code_challenge/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//TODO implement shared preferences to save locale selection and continue when is selected
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => LocaleProvider(),
    builder: (context, child) {
      final provider = Provider.of<LocaleProvider>(context, listen: true);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter APP ',
        locale: provider.locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(),
        home: const LanguageSelectorPage(),
        routes: appRoutes,
      );
    },
  );
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ravn_code_challenge/generated/l10n.dart';
import 'package:ravn_code_challenge/l10n/l10n.dart';
import 'package:ravn_code_challenge/modules/language/language_widget.dart';
import 'package:ravn_code_challenge/provider/locale_provider.dart';
import 'package:ravn_code_challenge/routes/route_names.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: true);
    final locale = provider.locale ?? Locale('en');
    print(locale);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            LanguageWidget(locale: locale,),
            Text(S.current.selectALanguage),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: List.generate(S.delegate.supportedLocales.length,
                (index) => Center(
                  child: MaterialButton(
                    child: Text(
                      L10n.getFlag(S.delegate.supportedLocales[index].languageCode),
                      style: const TextStyle(fontSize: 50),
                    ),
                    onPressed: () {
                      final providerSet =
                      Provider.of<LocaleProvider>(context, listen: false);
                      providerSet.setLocale(S.delegate.supportedLocales[index]);
                      Navigator.pushNamed(context,
                          RouteNames.splash,
                      );
                    },
                  ),
                ),),
            )
          ],
        ),
      ),
    );
  }
}

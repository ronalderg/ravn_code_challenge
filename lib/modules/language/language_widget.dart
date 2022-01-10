import 'package:flutter/material.dart';
import 'package:ravn_code_challenge/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({
    Key? key,
    this.locale,
  }) : super(key: key);
  Locale? locale;

  @override
  Widget build(BuildContext context) {
    //final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale!.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: const TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}
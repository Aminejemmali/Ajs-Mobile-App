import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  final Locale locale;
  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  Localization(this.locale);

  static const LocalizationsDelegate<Localization> delegate = _LocalizationDelegate();

  late Map<String, String> _localizedStrings;

  Future<void> load() async {
    String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations = Localization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

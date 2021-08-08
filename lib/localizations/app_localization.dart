import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static const supportedLocales = [Locale('en'), Locale('vi')];

  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //Load language json file
  Future<bool> load() async {
    final jsonStr =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> json = jsonDecode(jsonStr);
    _localizedStrings = json.map((key, val) {
      return MapEntry(key, val.toString());
    });
    return true;
  }

  String localized(String key) {
    return _localizedStrings[key] ?? key;
  }

  //Localized keys

  String hello() => localized('hello');
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'fr.dart';
import 'en.dart';

class AppLocalizations {
  late final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String>? _sentences;

  Future<bool> load() async {
    //String data = await rootBundle.loadString('resources/lang/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = this.locale.languageCode == "fr" ? fr : en;

    this._sentences = Map();
    _result.forEach((String key, dynamic value) {
      this._sentences![key] = value.toString();
    });

    return true;
  }

  String? trans(String? key) {
    if (key == null) return key;
    var variable = [];

    if (key.contains(":")) {
      variable = key.substring(key.indexOf(":") + 1).split(',');
      key = key.substring(0, key.indexOf(":"));
    }
    if (!this._sentences!.containsKey(key.toLowerCase())) {
      return key;
    }
    var sentence = this._sentences![key.toLowerCase()];
    variable.forEach((el) {
      sentence = sentence?.replaceFirst(":value", el);
    });
    return sentence;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var logger = Logger();

    logger.d("locale $locale");
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();

    logger.d("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

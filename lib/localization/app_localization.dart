import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_constants.dart';

//TODO ************************ DO NOT MODIFY OR DELETE. **********************

class ApplicationLocalization {
  ApplicationLocalization(this.locale);

  final Locale locale;
  static ApplicationLocalization of(BuildContext context) {
    return Localizations.of<ApplicationLocalization>(context, ApplicationLocalization);
  }

  Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString(LocaleResPath + '${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<ApplicationLocalization> delegate = _AppLocalizationsDelegate();
}

//TODO ************************ DO NOT MODIFY OR DELETE. **********************

class _AppLocalizationsDelegate extends LocalizationsDelegate<ApplicationLocalization> {

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return LANGUAGE_LIST.contains(locale.languageCode);
  }

  @override
  Future<ApplicationLocalization> load(Locale locale) async {
    ApplicationLocalization localization = new ApplicationLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<ApplicationLocalization> old) => false;
}

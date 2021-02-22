import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_localization.dart';

const String LANGUAGE_CODE = 'languageCode';

//TODO - languages translations path.
const String LocaleResPath = 'languages/';

//TODO - ADD languages List HERE...
const List<String> LANGUAGE_LIST = ['en', 'fa', 'ar', 'hi'];

//TODO - ADD languages code HERE...
const String ENGLISH = 'en';
const String FARSI = 'fa';
const String ARABIC = 'ar';
const String HINDI = 'hi';


//TODO - ADD languages Locale HERE...
Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case FARSI:
      return Locale(FARSI, "IR");
    case ARABIC:
      return Locale(ARABIC, "SA");
    case HINDI:
      return Locale(HINDI, "IN");
    default:
      return Locale(ENGLISH, 'US');
  }
}

//TODO ***************** DO NOT MODIFY OR DELETE. ****************************
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}


String getTranslated(BuildContext context, String key) {
  return ApplicationLocalization.of(context).translate(key);
}

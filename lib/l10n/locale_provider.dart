import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('sr');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['sr', 'en'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    _locale = _locale.languageCode == 'sr' ? const Locale('en') : const Locale('sr');
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class AppStore {
  final Map<Locale, String> supportedLocales = {
    Locale('en', 'US'): 'English',
    Locale('pt', 'BR'): 'Português',
  };

  final ValueNotifier<Locale?> _locale = ValueNotifier<Locale?>(null);

  ValueNotifier<Locale?> get localeNotifier => _locale;
  Locale? get locale => _locale.value;
  set locale(Locale? newLocale) {
    if (_locale.value != newLocale) {
      _locale.value = newLocale;
    }
  }
}

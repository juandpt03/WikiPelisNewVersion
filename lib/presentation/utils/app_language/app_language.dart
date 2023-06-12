import 'package:flutter/material.dart';

class AppLanguage {
  static Locale _appLocale = WidgetsBinding.instance.platformDispatcher.locale;

  static setLocale(Locale locale) {
    _appLocale = locale;
  }

  static Locale getLocale() => _appLocale;
}

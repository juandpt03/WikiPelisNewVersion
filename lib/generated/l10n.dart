// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `En Cines`
  String get enCines {
    return Intl.message(
      'En Cines',
      name: 'enCines',
      desc: '',
      args: [],
    );
  }

  /// `Próximamente`
  String get proximamente {
    return Intl.message(
      'Próximamente',
      name: 'proximamente',
      desc: '',
      args: [],
    );
  }

  /// `En este mes`
  String get enEsteMes {
    return Intl.message(
      'En este mes',
      name: 'enEsteMes',
      desc: '',
      args: [],
    );
  }

  /// `Populares`
  String get populares {
    return Intl.message(
      'Populares',
      name: 'populares',
      desc: '',
      args: [],
    );
  }

  /// `Mejores Calificadas`
  String get mejoresCalificadas {
    return Intl.message(
      'Mejores Calificadas',
      name: 'mejoresCalificadas',
      desc: '',
      args: [],
    );
  }

  /// `Desde Siempre`
  String get desdeSiempre {
    return Intl.message(
      'Desde Siempre',
      name: 'desdeSiempre',
      desc: '',
      args: [],
    );
  }

  /// `Buscar Película`
  String get buscarPelicula {
    return Intl.message(
      'Buscar Película',
      name: 'buscarPelicula',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get inicio {
    return Intl.message(
      'Inicio',
      name: 'inicio',
      desc: '',
      args: [],
    );
  }

  /// `Categorías`
  String get categorias {
    return Intl.message(
      'Categorías',
      name: 'categorias',
      desc: '',
      args: [],
    );
  }

  /// `Favoritos`
  String get favoritos {
    return Intl.message(
      'Favoritos',
      name: 'favoritos',
      desc: '',
      args: [],
    );
  }

  /// `Configuraciones`
  String get configuraciones {
    return Intl.message(
      'Configuraciones',
      name: 'configuraciones',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

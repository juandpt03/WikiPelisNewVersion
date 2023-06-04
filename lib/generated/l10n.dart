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

  /// `At the cinema`
  String get enCines {
    return Intl.message(
      'At the cinema',
      name: 'enCines',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get proximamente {
    return Intl.message(
      'Upcoming',
      name: 'proximamente',
      desc: '',
      args: [],
    );
  }

  /// `In this month`
  String get enEsteMes {
    return Intl.message(
      'In this month',
      name: 'enEsteMes',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get populares {
    return Intl.message(
      'Popular',
      name: 'populares',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get mejoresCalificadas {
    return Intl.message(
      'Top Rated',
      name: 'mejoresCalificadas',
      desc: '',
      args: [],
    );
  }

  /// `All the time`
  String get desdeSiempre {
    return Intl.message(
      'All the time',
      name: 'desdeSiempre',
      desc: '',
      args: [],
    );
  }

  /// `Search for a movie`
  String get buscarPelicula {
    return Intl.message(
      'Search for a movie',
      name: 'buscarPelicula',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get inicio {
    return Intl.message(
      'Home',
      name: 'inicio',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categorias {
    return Intl.message(
      'Categories',
      name: 'categorias',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritos {
    return Intl.message(
      'Favorites',
      name: 'favoritos',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get configuraciones {
    return Intl.message(
      'Settings',
      name: 'configuraciones',
      desc: '',
      args: [],
    );
  }

  /// `Loading Movies`
  String get cargandoPeliculas {
    return Intl.message(
      'Loading Movies',
      name: 'cargandoPeliculas',
      desc: '',
      args: [],
    );
  }

  /// `Buying Popcorn`
  String get comprandoPalomitas {
    return Intl.message(
      'Buying Popcorn',
      name: 'comprandoPalomitas',
      desc: '',
      args: [],
    );
  }

  /// `Loading popular ones`
  String get cargandoPopulares {
    return Intl.message(
      'Loading popular ones',
      name: 'cargandoPopulares',
      desc: '',
      args: [],
    );
  }

  /// `Calling my girlfriend`
  String get llamandoAMiNovia {
    return Intl.message(
      'Calling my girlfriend',
      name: 'llamandoAMiNovia',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get revisaTuConexionAInternet {
    return Intl.message(
      'Please check your internet connection',
      name: 'revisaTuConexionAInternet',
      desc: '',
      args: [],
    );
  }

  /// `How strange`
  String get estoSePusoExtrano {
    return Intl.message(
      'How strange',
      name: 'estoSePusoExtrano',
      desc: '',
      args: [],
    );
  }

  /// `Yamerooo!`
  String get yaMeroooo {
    return Intl.message(
      'Yamerooo!',
      name: 'yaMeroooo',
      desc: '',
      args: [],
    );
  }

  /// `This is taking longer than expected.`
  String get estoEstTardandoMsDeLoEsperado {
    return Intl.message(
      'This is taking longer than expected.',
      name: 'estoEstTardandoMsDeLoEsperado',
      desc: '',
      args: [],
    );
  }

  /// `Please wait.`
  String get esperePorFavor {
    return Intl.message(
      'Please wait.',
      name: 'esperePorFavor',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get cargando {
    return Intl.message(
      'Loading...',
      name: 'cargando',
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

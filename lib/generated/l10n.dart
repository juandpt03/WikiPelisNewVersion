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

  /// `Select your favorite color`
  String get selecioneSuColorFavorito {
    return Intl.message(
      'Select your favorite color',
      name: 'selecioneSuColorFavorito',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get salir {
    return Intl.message(
      'Close',
      name: 'salir',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get aceptar {
    return Intl.message(
      'Ok',
      name: 'aceptar',
      desc: '',
      args: [],
    );
  }

  /// `Theme settings`
  String get ajustesDeTema {
    return Intl.message(
      'Theme settings',
      name: 'ajustesDeTema',
      desc: '',
      args: [],
    );
  }

  /// `Change theme color`
  String get cambiarColorDeTema {
    return Intl.message(
      'Change theme color',
      name: 'cambiarColorDeTema',
      desc: '',
      args: [],
    );
  }

  /// `Light/Dark mode`
  String get modoLuzoscuridad {
    return Intl.message(
      'Light/Dark mode',
      name: 'modoLuzoscuridad',
      desc: '',
      args: [],
    );
  }

  /// `Language settings`
  String get configuracinDeIdioma {
    return Intl.message(
      'Language settings',
      name: 'configuracinDeIdioma',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selecioneSuIdioma {
    return Intl.message(
      'Select your language',
      name: 'selecioneSuIdioma',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get espanol {
    return Intl.message(
      'Spanish',
      name: 'espanol',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get ingles {
    return Intl.message(
      'English',
      name: 'ingles',
      desc: '',
      args: [],
    );
  }

  /// `No Trailer found`
  String get noSeEncontroNingunTrailer {
    return Intl.message(
      'No Trailer found',
      name: 'noSeEncontroNingunTrailer',
      desc: '',
      args: [],
    );
  }

  /// `Error, the videos could not be loaded`
  String get errorNoSeLogroCargarLosVideos {
    return Intl.message(
      'Error, the videos could not be loaded',
      name: 'errorNoSeLogroCargarLosVideos',
      desc: '',
      args: [],
    );
  }

  /// `Similar Movies`
  String get peliculasSimilares {
    return Intl.message(
      'Similar Movies',
      name: 'peliculasSimilares',
      desc: '',
      args: [],
    );
  }

  /// `Profession: `
  String get profesion {
    return Intl.message(
      'Profession: ',
      name: 'profesion',
      desc: '',
      args: [],
    );
  }

  /// ` Years old`
  String get anios {
    return Intl.message(
      ' Years old',
      name: 'anios',
      desc: '',
      args: [],
    );
  }

  /// `Birthdate: `
  String get cumpleanos {
    return Intl.message(
      'Birthdate: ',
      name: 'cumpleanos',
      desc: '',
      args: [],
    );
  }

  /// `Information: `
  String get informacion {
    return Intl.message(
      'Information: ',
      name: 'informacion',
      desc: '',
      args: [],
    );
  }

  /// `Death: `
  String get muerte {
    return Intl.message(
      'Death: ',
      name: 'muerte',
      desc: '',
      args: [],
    );
  }

  /// `Place of birth: `
  String get lugarDeNacimiento {
    return Intl.message(
      'Place of birth: ',
      name: 'lugarDeNacimiento',
      desc: '',
      args: [],
    );
  }

  /// `Filmography`
  String get filmografia {
    return Intl.message(
      'Filmography',
      name: 'filmografia',
      desc: '',
      args: [],
    );
  }

  /// `Available on:`
  String get disponibleEn {
    return Intl.message(
      'Available on:',
      name: 'disponibleEn',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon...`
  String get muyPronto {
    return Intl.message(
      'Coming soon...',
      name: 'muyPronto',
      desc: '',
      args: [],
    );
  }

  /// `Recommended subscription`
  String get subscripcionRecomendada {
    return Intl.message(
      'Recommended subscription',
      name: 'subscripcionRecomendada',
      desc: '',
      args: [],
    );
  }

  /// `Ideal streaming platform`
  String get subscripcionIdeal {
    return Intl.message(
      'Ideal streaming platform',
      name: 'subscripcionIdeal',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any favorite movies.`
  String get noTienesPeliculasFavoritas {
    return Intl.message(
      'You don\'t have any favorite movies.',
      name: 'noTienesPeliculasFavoritas',
      desc: '',
      args: [],
    );
  }

  /// `Start exploring`
  String get comienzaAExplorar {
    return Intl.message(
      'Start exploring',
      name: 'comienzaAExplorar',
      desc: '',
      args: [],
    );
  }

  /// `Oh no! These movies are not available on any platform. Please add more movies.`
  String get ohhhNoEstasPeliculasNoEstanDisponiblesEnNingunaPlataforma {
    return Intl.message(
      'Oh no! These movies are not available on any platform. Please add more movies.',
      name: 'ohhhNoEstasPeliculasNoEstanDisponiblesEnNingunaPlataforma',
      desc: '',
      args: [],
    );
  }

  /// `Released: `
  String get estreno {
    return Intl.message(
      'Released: ',
      name: 'estreno',
      desc: '',
      args: [],
    );
  }

  /// `Videos feed`
  String get listaDeVideos {
    return Intl.message(
      'Videos feed',
      name: 'listaDeVideos',
      desc: '',
      args: [],
    );
  }

  /// `Watch Trailers`
  String get verTrailers {
    return Intl.message(
      'Watch Trailers',
      name: 'verTrailers',
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

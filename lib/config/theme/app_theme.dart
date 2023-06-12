import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final bool? isDarkMode;

  AppTheme({this.isDarkMode});
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xffD50000),
        brightness: isDarkMode! ? Brightness.dark : Brightness.light,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      );
  AppTheme copyWith({bool? isDarkMode}) => AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode!,
      );
}

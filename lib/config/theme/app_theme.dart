import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final bool? isDarkMode;
  final String? colorSchemeSeed;

  AppTheme({this.colorSchemeSeed, this.isDarkMode});
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(int.parse('0x${colorSchemeSeed!}')),
        brightness: isDarkMode! ? Brightness.dark : Brightness.light,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      );
  AppTheme copyWith({bool? isDarkMode, String? colorSchemeSeed}) => AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        colorSchemeSeed: colorSchemeSeed ?? this.colorSchemeSeed,
      );
}

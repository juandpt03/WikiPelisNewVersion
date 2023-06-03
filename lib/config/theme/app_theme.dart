import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xffD50000),
        // brightness: Brightness.dark,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      );
}

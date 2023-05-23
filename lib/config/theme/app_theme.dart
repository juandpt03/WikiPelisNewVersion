import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xffD50000),
        // brightness: Brightness.dark,
      );
}

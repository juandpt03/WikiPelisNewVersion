import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class FlutterNativeSplashScreen {
  static void preserve() {
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
  }

  static void removeSplash() {
    FlutterNativeSplash.remove();
  }
}

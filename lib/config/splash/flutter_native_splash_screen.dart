import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class FlutterNativeSplashScreen {
  static preserve() {
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
  }

  static removeSplash() {
    FlutterNativeSplash.remove();
  }
}

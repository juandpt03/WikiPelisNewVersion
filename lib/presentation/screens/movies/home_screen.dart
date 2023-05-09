import 'package:flutter/material.dart';
import 'package:wikipelis/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Enviroment.theMovieDbKey),
      ),
    );
  }
}

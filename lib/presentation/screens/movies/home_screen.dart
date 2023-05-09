import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}

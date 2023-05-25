import 'package:flutter/material.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home_screen';
  final Widget chidlView;
  const HomeScreen({super.key, required this.chidlView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chidlView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.houseUser), label: 'Inicio'),
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.tags), label: 'Categorias'),
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.heart), label: 'Favoritos'),
    ]);
  }
}

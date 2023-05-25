import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        context.go('/');
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    final String currentLocation = GoRouterState.of(context).location;

    switch (currentLocation) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      case '/settings':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.bold, color: colors.primary);
    return GNav(
        selectedIndex: getCurrentIndex(context),
        onTabChange: (index) => onItemTapped(context, index),

        //Ela gap es la separación entre texto e ícono
        gap: 10,
        duration: const Duration(milliseconds: 200),
        color: colors.secondary,
        activeColor: colors.primary,
        textStyle: textStyle,
        tabBorderRadius: 100,
        haptic: true,
        iconSize: 20,
        hoverColor: Colors.black12,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        tabActiveBorder: Border.all(width: 1, color: colors.onPrimaryContainer),
        tabMargin: const EdgeInsets.all(10),
        tabBackgroundGradient: LinearGradient(colors: [
          colors.secondary.withOpacity(0.1),
          colors.primary.withOpacity(0.1),
        ]),
        // tabBorder: Border.all(color: colors.secondary),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            text: 'Home',
          ),
          GButton(
            icon: FontAwesomeIcons.tags,
            text: 'Categories',
          ),
          GButton(
            icon: FontAwesomeIcons.solidHeart,
            text: 'Like',
          ),
          GButton(
            icon: FontAwesomeIcons.wrench,
            text: 'Settings',
          )
        ]);

    // viejo BottomNavigarionBar
    // return BottomNavigationBar(elevation: 0, items: const [
    //   BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.houseUser), label: 'Inicio'),
    //   BottomNavigationBarItem(
    //       icon: FaIcon(), label: 'Categorias'),
    //   BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.heart), label: 'Favoritos'),
    //   BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.person), label: 'Perfil'),
    // ]);
  }
}

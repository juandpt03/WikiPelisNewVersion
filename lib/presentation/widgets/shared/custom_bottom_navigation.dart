import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wikipelis/generated/l10n.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({super.key, required this.currentIndex});
  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.bold, color: colors.primary);
    return GNav(
        selectedIndex: currentIndex,
        onTabChange: (indexNavigation) =>
            onItemTapped(context, indexNavigation),

        //Ela gap es la separación entre texto e ícono
        gap: 10,
        duration: const Duration(milliseconds: 200),
        color: colors.secondary,
        activeColor: colors.primary,
        textStyle: textStyle,
        // tabBorderRadius: 100,
        haptic: true,
        iconSize: 20,
        hoverColor: Colors.black12,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // tabActiveBorder: Border.all(width: 1, color: colors.onPrimaryContainer),
        tabMargin: const EdgeInsets.all(10),
        // tabBackgroundGradient: LinearGradient(colors: [
        //   colors.secondary.withOpacity(0.1),
        //   colors.primary.withOpacity(0.1),
        // ]),
        // tabBorder: Border.all(color: colors.secondary),
        tabs: [
          GButton(
            icon: FontAwesomeIcons.house,
            text: S.of(context).inicio,
          ),
          GButton(
            icon: FontAwesomeIcons.tags,
            text: S.of(context).categorias,
          ),
          GButton(
            icon: FontAwesomeIcons.solidHeart,
            text: S.of(context).favoritos,
          ),
          GButton(
            icon: FontAwesomeIcons.wrench,
            text: S.of(context).configuraciones,
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

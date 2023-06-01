import 'package:flutter/material.dart';
import 'package:wikipelis/presentation/views/views.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home_screen';
  final int pageIndex;
  final viewRoutes = const <Widget>[
    HomeView(),
    CategoriesView(),
    FavoritesView(),
    SizedBox(),
  ];
  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}

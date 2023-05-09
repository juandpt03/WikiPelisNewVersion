import 'package:go_router/go_router.dart';
import 'package:wikipelis/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

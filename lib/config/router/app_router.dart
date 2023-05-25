import 'package:go_router/go_router.dart';
import 'package:wikipelis/presentation/screens/screens.dart';
import 'package:wikipelis/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(chidlView: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.route,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';
                  return MovieScreen(
                    movieId: movieId,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            },
          ),
        ])
  ],
);
//Rutas padres/hijo

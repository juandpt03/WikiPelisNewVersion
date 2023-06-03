import 'package:go_router/go_router.dart';
import 'package:wikipelis/presentation/screens/screens.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_category_masonry.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.route,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(
          pageIndex: pageIndex,
        );
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
        GoRoute(
          path: 'categories/:category',
          name: MovieCategoryMasonry.route,
          builder: (context, state) {
            final categoryId = state.pathParameters['category'] ?? '';

            return MovieCategoryMasonry(genreId: categoryId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
//Rutas padres/hijo

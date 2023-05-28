import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_masonry.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  Future<void> loadNextPage() async {
    if (isLastPage || isLoading) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) isLastPage = true;
  }

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMoviesProvider).values.toList();
    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.heart,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'Ohhh no!!',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            Text(
              'No tienes películas favoritas',
              style: TextStyle(fontSize: 20, color: colors.secondary),
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: Text(
                'Comienza a explorar',
                style: TextStyle(color: colors.primary),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        movies: movies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}

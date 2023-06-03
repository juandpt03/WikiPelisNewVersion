import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/widgets/categories/categorie_card.dart';

class CategoriesView extends ConsumerStatefulWidget {
  const CategoriesView({super.key});

  @override
  ConsumerState<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends ConsumerState<CategoriesView> {
  @override
  void initState() {
    super.initState();

    ref.read(moviesGenresProvider.notifier).loadGenres().whenComplete(() {
      final genres = ref.read(moviesGenresProvider);
      for (final genre in genres) {
        ref.read(moviesByGenreProvider(genre.id).notifier).loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(moviesGenresProvider);
    if (genres.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      )); // muestra un indicador de carga si la lista de películas está vacía
    }
    final Random rnd = Random();
    final int movieRnd = rnd.nextInt(genres.length);

    return ListView.builder(
      itemBuilder: (context, index) {
        final movies = ref.watch(moviesByGenreProvider(genres[index].id));
        if (movies.isEmpty) {
          return FadeOut(child: Container());
        }
        return GestureDetector(
          onTap: () => context.push('/home/1/categories/${genres[index].id}'),
          child: CategorieCard(
            movie: movies[movieRnd],
            genre: genres[index],
          ),
        );
      },
      itemCount: genres.length,
    );
  }
}

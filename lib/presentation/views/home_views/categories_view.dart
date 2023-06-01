import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

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
    return ListView.builder(
      itemBuilder: (context, index) {
        final movies = ref.watch(moviesByGenreProvider(genres[index].id));
        return MovieHorizontalListView(
          movies: movies,
          title: genres[index].name,
          loadNextPage: () => ref
              .read(moviesByGenreProvider(genres[index].id).notifier)
              .loadNextPage(),
        );
      },
      itemCount: genres.length,
    );
  }
}

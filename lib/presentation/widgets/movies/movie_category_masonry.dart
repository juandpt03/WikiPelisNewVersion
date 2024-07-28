import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_poster_link.dart';

class MovieCategoryMasonry extends ConsumerStatefulWidget {
  final String genreId;

  static const String route = 'movie_category';
  const MovieCategoryMasonry({
    required this.genreId,
    super.key,
  });

  @override
  ConsumerState<MovieCategoryMasonry> createState() =>
      _MovieCategoryMasonryState();
}

class _MovieCategoryMasonryState extends ConsumerState<MovieCategoryMasonry> {
  ScrollController inifiniteScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(moviesByGenreProvider(widget.genreId).notifier).loadNextPage();

    inifiniteScrollController.addListener(() {
      if (inifiniteScrollController.position.pixels + 100 >=
          inifiniteScrollController.position.maxScrollExtent) {
        ref.read(moviesByGenreProvider(widget.genreId).notifier).loadNextPage();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    inifiniteScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesByGenreProvider(widget.genreId));
    final genres = ref.watch(moviesGenresProvider);
    final String title =
        genres.firstWhere((genre) => genre.id == widget.genreId).name;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MasonryGridView.count(
          scrollDirection: Axis.vertical,
          controller: inifiniteScrollController,
          itemCount: movies.length,
          crossAxisCount: 3,
          // mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return FadeInUp(
              child: MoviePosterLink(movie: movie, height: 250),
            );
          },
        ),
      ),
    );
  }
}

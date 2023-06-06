import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_poster_link.dart';

class MovieFavoritesMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieFavoritesMasonry({
    super.key,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MovieFavoritesMasonry> createState() => _MovieFavoritesMasonryState();
}

class _MovieFavoritesMasonryState extends State<MovieFavoritesMasonry> {
  ScrollController inifiniteScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    inifiniteScrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (inifiniteScrollController.position.pixels + 100 >=
          inifiniteScrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        scrollDirection: Axis.vertical,
        controller: inifiniteScrollController,
        itemCount: widget.movies.length,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                _MovieFavorite(movie: movie)
              ],
            );
          }
          return _MovieFavorite(movie: movie);
        },
      ),
    );
  }
}

class _MovieFavorite extends StatelessWidget {
  const _MovieFavorite({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: MoviePosterLink(movie: movie),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

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
                _MovieFavorite(
                    movie: movie, textStyle: textStyle, colors: colors)
              ],
            );
          }
          return _MovieFavorite(
              movie: movie, textStyle: textStyle, colors: colors);
        },
      ),
    );
  }
}

class _MovieFavorite extends StatelessWidget {
  const _MovieFavorite({
    required this.movie,
    required this.textStyle,
    required this.colors,
  });

  final Movie movie;
  final TextTheme textStyle;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            MoviePosterLink(movie: movie),
            const SizedBox(
              width: 5,
            ),

            // Title

            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 1,
                style: textStyle.titleSmall!.copyWith(
                    color: colors.onBackground,
                    overflow: TextOverflow.ellipsis),
              ),
            ),

            //Rating

            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.starHalfStroke,
                    color: Colors.yellow.shade900,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${movie.voteAverage}',
                    style: textStyle.bodyMedium
                        ?.copyWith(color: Colors.yellow.shade900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

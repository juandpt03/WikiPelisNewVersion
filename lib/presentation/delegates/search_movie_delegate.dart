import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wikipelis/config/helpers/human_formats.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/generated/l10n.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  List<Movie> initialMovies;
  final SearchMoviesCallback searchMovies;
  final BuildContext context;
  void clearStreams() {
    debouncedMovies.close();
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder<List<Movie>>(
      initialData: initialMovies,
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            );
          },
          itemCount: movies.length,
        );
      },
      stream: debouncedMovies.stream,
    );
  }

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoading = StreamController.broadcast();
  Timer? _debounceTimer;
  void _onQueryChanged(String query) {
    isLoading.add(false);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      isLoading.add(true);
      final movies = await searchMovies(query);
      if (debouncedMovies.isClosed) return;
      debouncedMovies.sink.add(movies);
      initialMovies = movies;
    });
  }

  SearchMovieDelegate(
      {required this.initialMovies,
      required this.searchMovies,
      required this.context})
      : super(
          searchFieldStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
        );

  @override
  String get searchFieldLabel => S.of(context).buscarPelicula;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoading.stream,
        builder: (context, snapshot) {
          return snapshot.data == false
              ? SpinPerfect(
                  duration: const Duration(seconds: 10),
                  spins: 20,
                  infinite: true,
                  child: IconButton(
                    onPressed: () {
                      query = '';
                    },
                    icon: const FaIcon(FontAwesomeIcons.spinner),
                  ),
                )
              : FadeIn(
                  animate: query.isNotEmpty,
                  child: IconButton(
                    onPressed: () {
                      query = '';
                    },
                    icon: const FaIcon(FontAwesomeIcons.xmark),
                  ),
                );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      },
      icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieItem({
    required this.movie,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            //Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textStyle.titleMedium!
                        .copyWith(color: colors.onBackground),
                  ),
                  (movie.overview.length > 100)
                      ? Text(
                          '${movie.overview.substring(0, 100)}...',
                          style: textStyle.bodyMedium!
                              .copyWith(color: colors.onBackground),
                        )
                      : Text(
                          movie.overview,
                          style: textStyle.bodyMedium!
                              .copyWith(color: colors.onBackground),
                        ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow[900],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyle.bodyMedium?.copyWith(
                          color: Colors.yellow[900],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

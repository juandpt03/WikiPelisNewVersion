import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/delegates/search_movie_delegate.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.film,
              color: colors.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'WikiPelis',
              style: style!.copyWith(color: colors.onBackground, fontSize: 20),
            ),
            const Spacer(),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                        context: context,
                        searchMovies: (String query) {
                          return ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery(query);
                        },
                        initialMovies: searchedMovies),
                  ).then((movie) {
                    if (movie != null) {
                      context.push('/home/0/movie/${movie.id}');
                    }
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: colors.primary,
                ))
          ],
        ),
      ),
    );
  }
}

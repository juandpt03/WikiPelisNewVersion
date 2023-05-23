import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final searchQueryProvider = StateProvider((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchedMoviesNotifier(ref,
      searchMovies: movieRepository.searchMovies);
});
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;
  SearchedMoviesNotifier(this.ref, {required this.searchMovies}) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return state;
  }
}

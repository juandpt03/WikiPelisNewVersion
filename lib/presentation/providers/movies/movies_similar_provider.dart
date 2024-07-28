import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

// Peliculas Similares

final similarMoviesProvider =
    StateNotifierProvider.autoDispose<MoviesSimilarNotifier, List<Movie>>(
        (ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getMoviesSimilar;
  return MoviesSimilarNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MoviesSimilarCallBack = Future<List<Movie>> Function(
    {required String movieId, int page});

class MoviesSimilarNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MoviesSimilarCallBack fetchMoreMovies;
  MoviesSimilarNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage({required String movieId}) async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies =
        await fetchMoreMovies(movieId: movieId, page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
  }
}

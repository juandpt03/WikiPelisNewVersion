import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/providers/movies/movies_repository_provider.dart';

// Peliculas en Cartelera
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Peliculas Populares
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Top Películas calificadas
final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).topRated;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});
// top Películas a estrenar

final upComingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).upComing;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
  }
}

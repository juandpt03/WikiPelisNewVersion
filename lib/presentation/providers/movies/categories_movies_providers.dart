import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

//Traer películas por género
final moviesByGenreProvider =
    StateNotifierProvider.family<MoviesCategoriesNotifier, List<Movie>, String>(
        (ref, String genreId) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getMovieByGenre;
  return MoviesCategoriesNotifier(
      fetchMoreMovies: fetchMoreMovies, genreId: genreId);
});
typedef MovieCategoryCallBack = Future<List<Movie>> Function(
    {required String genreId, int page});

class MoviesCategoriesNotifier extends StateNotifier<List<Movie>> {
  String genreId;
  int currentPage = 0;
  bool isLoading = false;
  MovieCategoryCallBack fetchMoreMovies;
  MoviesCategoriesNotifier(
      {required this.genreId, required this.fetchMoreMovies})
      : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies =
        await fetchMoreMovies(genreId: genreId, page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
  }
}

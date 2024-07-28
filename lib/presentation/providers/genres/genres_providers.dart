import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/genre.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final moviesGenresProvider =
    StateNotifierProvider<MoviesGenreNotifier, List<Genre>>((ref) {
  final fetchCategories = ref.watch(movieRepositoryProvider).getMovieGenres;
  return MoviesGenreNotifier(fetchCategories: fetchCategories);
});
typedef MovieGenresCallBack = Future<List<Genre>> Function();

class MoviesGenreNotifier extends StateNotifier<List<Genre>> {
  MovieGenresCallBack fetchCategories;
  MoviesGenreNotifier({required this.fetchCategories}) : super([]);

  Future<List<Genre>> loadGenres() async {
    final genres = await fetchCategories();
    state = genres;
    return genres;
  }
}

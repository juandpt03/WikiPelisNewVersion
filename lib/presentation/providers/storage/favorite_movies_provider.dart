import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/domain/repositories/local_storage_repository.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 12);
    page++;
    final Map<int, Movie> tempMovies = {};
    for (Movie movie in movies) {
      tempMovies[movie.id] = movie;
    }
    state = {...state, ...tempMovies};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    // Cuando se llama a toggleFavorite, primero se verifca si la película ya está en favoritos.
    final bool isMovieInFavorites =
        await localStorageRepository.isMovieFavorite(movie.id);

// independientemente de si la película está en favoritos o no, se alterna en la base de datos.
    await localStorageRepository.toggleFavorite(movie);

// Si la película estaba en favoritos, se elimina del estado
    if (isMovieInFavorites) {
      state.remove(movie.id);
    } else {
      // Si la película no estaba en favoritos, se añade al estado.
      state[movie.id] = movie;
    }

// Finalmente, se asinga un nuevo mapa al estado para forzar una actualización.
    state = {...state};
  }
}

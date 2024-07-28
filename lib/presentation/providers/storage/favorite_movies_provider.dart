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
  bool isLoading = false;
  final int limit = 12;
  final LocalStorageRepository localStorageRepository;
  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    if (isLoading) return [];
    isLoading = true;
    final movies = await localStorageRepository.loadMovies(
        offset: page * 10, limit: limit);
    page++;
    final Map<int, Movie> tempMovies = {};
    for (Movie movie in movies) {
      tempMovies[movie.id] = movie;
    }
    state = {...state, ...tempMovies};
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
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
      state = {...state};
    } else {
      // verificar si está cargando películas para que en ese momento se añdada la película y no antes
      if (isLoading && state.length >= limit) {
        state = {...state, movie.id: movie};
      }
      // verficar si  las películas en favoritos son menor al tamaño límite, en ese caso se agrega la película
      if (state.length < limit) state = {...state, movie.id: movie};
      //verifica si el tamaño es mayor a límite de pantalla, pero también se tiene en cuenta en caso de que no esté cargando películas
      if (state.length > limit && !isLoading) {
        state = {...state, movie.id: movie};
      }
    }
  }
}

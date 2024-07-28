import 'package:wikipelis/domain/entities/entities.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> topRated({int page = 1});
  Future<List<Movie>> upComing({int page = 1});
  Future<Movie> getMovieById({required String id});
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getMovieByGenre({required String genreId, int page = 1});
  Future<List<Genre>> getMovieGenres();
  Future<List<MovieTrailers>> getMovieTrailers({required String movieId});
  Future<List<Movie>> getMoviesSimilar({required String movieId, int page = 1});
  Future<List<Movie>> getMoviesByPersonId({
    required String personId,
  });
}

import 'package:wikipelis/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> topRated({int page = 1});
  Future<List<Movie>> upComing({int page = 1});
  Future<Movie> getMovieById({required String id});
  Future<List<Movie>> searchMovies(String query);
}

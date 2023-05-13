import 'package:dio/dio.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/movies_datasource.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/infrastructure/mappers/movie_mapper.dart';
import 'package:wikipelis/infrastructure/models/moviedb/the_movidedb_response.dart';

class TheMoviedbDatasourceImpl extends MoviesDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Enviroment.theMovieDbKey,
    'language': 'es-CO',
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final moviedbResponse = TheMoviedbResponse.fromJson(response.data);
    final List<Movie> movies = moviedbResponse.results
        .where((movieTheMoviedb) =>
            movieTheMoviedb.posterPath != '' &&
            movieTheMoviedb.backdropPath != '')
        .map((movieTheMoviedb) =>
            MovieMapper.theMoviedbToEntity(movieTheMoviedb))
        .toList();
    return movies;
  }
}

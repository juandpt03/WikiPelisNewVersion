import 'package:dio/dio.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/movies_datasource.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/infrastructure/mappers/movie_mapper.dart';
import 'package:wikipelis/infrastructure/models/moviedb/the_movidedb_response.dart';

class TheMoviedbDatasourceImpl extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-CO',
      },
    ),
  );
  List<Movie> _jsonToMovies(Map<String, dynamic> jsonResponse) {
    final moviedbResponse = TheMoviedbResponse.fromJson(jsonResponse);
    final List<Movie> movies = moviedbResponse.results
        .where((movieTheMoviedb) =>
            movieTheMoviedb.posterPath != '' &&
            movieTheMoviedb.backdropPath != '')
        .map((movieTheMoviedb) =>
            MovieMapper.theMoviedbToEntity(movieTheMoviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> topRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> upComing({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }
}

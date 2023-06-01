import 'package:dio/dio.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/movies_datasource.dart';
import 'package:wikipelis/domain/entities/genre.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/infrastructure/mappers/genre_mapper.dart';
import 'package:wikipelis/infrastructure/mappers/movie_mapper.dart';
import 'package:wikipelis/infrastructure/models/models.dart';
import 'package:wikipelis/infrastructure/models/moviedb/genre_response.dart';

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

  @override
  Future<Movie> getMovieById({required String id}) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      return throw Exception('Movie With id: $id  not found');
    }

    final theMoviedbDetails = MovieDetailsTheMoviedb.fromJson(response.data);
    final Movie movie = MovieMapper.theMoviedDetailsToEntity(theMoviedbDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final response = await dio.get('/search/movie', queryParameters: {
      'query': query,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getMovieByGenre(
      {required String genreId, int page = 1}) async {
    final responseMovieByGenre = await dio.get(
      '/discover/movie/',
      queryParameters: {
        'with_genres': genreId,
        'page': page,
      },
    );
    return _jsonToMovies(responseMovieByGenre.data);
  }

  @override
  Future<List<Genre>> getMovieGenres() async {
    final response = await dio.get('/genre/movie/list');

    List<GenreModel> genreModel = GenreResponse.fromJson(response.data).genres;
    List<Genre> genres = genreModel
        .map((genreModel) => GenreMapper.genreResponseToEntity(genreModel))
        .toList();
    return genres;
  }
}

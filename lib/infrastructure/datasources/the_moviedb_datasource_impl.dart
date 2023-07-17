import 'package:dio/dio.dart';
import 'package:wikipelis/domain/entities/entities.dart';

import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/movies_datasource.dart';

import 'package:wikipelis/infrastructure/mappers/mappers.dart';
import 'package:wikipelis/infrastructure/models/models.dart';
import 'package:wikipelis/presentation/utils/utils.dart';

class TheMoviedbDatasourceImpl extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': AppLanguage.getLocale().toString().replaceAll('_', '-'),
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

  @override
  Future<List<MovieTrailers>> getMovieTrailers(
      {required String movieId}) async {
    final response = await dio.get('/movie/$movieId/videos');
    MovieTrailersModel movieTrailersModel =
        MovieTrailersModel.fromJson(response.data);
    List<MovieTrailers> movieTrailers = [];

    for (VideoInfoModel videoInfoModel in movieTrailersModel.results) {
      MovieTrailers movieTrailer =
          TrailersMapper.movieTrailerResponseToEntity(videoInfoModel);
      movieTrailers.add(movieTrailer);
    }
    return movieTrailers;
  }

  @override
  Future<List<Movie>> getMoviesSimilar(
      {required String movieId, int page = 1}) async {
    final response = await dio.get('/movie/$movieId/similar', queryParameters: {
      'page': page,
    });
    if (response.statusCode != 200) {
      return throw Exception('Movie With id: $movieId  not found');
    }
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getMoviesByPersonId({
    required String personId,
  }) async {
    final jsonResponse = await dio.get(
      '/person/$personId/movie_credits',
    );
    final moviedbResponse = PersonMoviesModel.fromJson(jsonResponse.data);
    final List<Movie> movies = moviedbResponse.cast
        .where((personMoviesTheMoviedb) =>
            personMoviesTheMoviedb.posterPath != '' &&
            personMoviesTheMoviedb.backdropPath != '')
        .map(
          (personMovieTheMoviedb) =>
              MovieMapper.thePersonMovieToEntity(personMovieTheMoviedb),
        )
        .toList();
    return movies;
  }
}

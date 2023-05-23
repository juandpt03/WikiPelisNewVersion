import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/infrastructure/models/moviedb/movie_details_the_moviedb.dart';
import 'package:wikipelis/infrastructure/models/moviedb/movie_the_moviedb.dart';

class MovieMapper {
  static Movie theMoviedbToEntity(MovieTheMoviedb theMoviedb) => Movie(
        adult: theMoviedb.adult,
        backdropPath: theMoviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${theMoviedb.backdropPath}'
            : 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpgh',
        genreIds: theMoviedb.genreIds.map((id) => id.toString()).toList(),
        id: theMoviedb.id,
        originalLanguage: theMoviedb.originalLanguage,
        originalTitle: theMoviedb.originalTitle,
        overview: theMoviedb.overview,
        popularity: theMoviedb.popularity,
        posterPath: theMoviedb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${theMoviedb.posterPath}'
            : 'https://lascrucesfilmfest.com/wp-content/uploads/2018/01/no-poster-available-737x1024.jpg',
        releaseDate: theMoviedb.releaseDate ?? DateTime.now(),
        title: theMoviedb.title,
        video: theMoviedb.video,
        voteAverage: theMoviedb.voteAverage,
        voteCount: theMoviedb.voteCount,
      );

  static Movie theMoviedDetailsToEntity(MovieDetailsTheMoviedb theMoviedb) =>
      Movie(
        adult: theMoviedb.adult,
        backdropPath: theMoviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${theMoviedb.backdropPath}'
            : '',
        genreIds: theMoviedb.genres.map((e) => e.name).toList(),
        id: theMoviedb.id,
        originalLanguage: theMoviedb.originalLanguage,
        originalTitle: theMoviedb.originalTitle,
        overview: theMoviedb.overview,
        popularity: theMoviedb.popularity,
        posterPath: theMoviedb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${theMoviedb.posterPath}'
            : '',
        releaseDate: theMoviedb.releaseDate,
        title: theMoviedb.title,
        video: theMoviedb.video,
        voteAverage: theMoviedb.voteAverage,
        voteCount: theMoviedb.voteCount,
      );
}

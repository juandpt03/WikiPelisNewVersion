import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/infrastructure/models/moviedb/movie_the_moviedb.dart';

class MovieMapper {
  static Movie theMoviedbToEntity(MovieTheMoviedb theMoviedb) => Movie(
        adult: theMoviedb.adult,
        backdropPath: theMoviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${theMoviedb.backdropPath}'
            : '',
        genreIds: theMoviedb.genreIds.map((id) => id.toString()).toList(),
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

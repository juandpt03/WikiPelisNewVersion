import 'package:wikipelis/domain/entities/genre.dart';
import 'package:wikipelis/infrastructure/models/moviedb/genre_response.dart';

class GenreMapper {
  static Genre genreResponseToEntity(GenreModel genre) =>
      Genre(genre.name, genre.id);
}

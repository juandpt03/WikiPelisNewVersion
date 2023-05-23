import 'package:wikipelis/domain/entities/actor.dart';
import 'package:wikipelis/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntitity(Cast cast) => Actor(
        character: cast.character,
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'assets/images/no-photo.png',
      );
}

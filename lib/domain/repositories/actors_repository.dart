import 'package:wikipelis/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String idMovie);
}

import 'package:wikipelis/domain/entities/entities.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovie(String idMovie);
  Future<Person> getPersonInfoById({required String personId});
}

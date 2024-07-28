import 'package:wikipelis/domain/datasources/actors_datasource.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/domain/repositories/actors_repository.dart';

class ActorMovieRepositoryImpl extends ActorsRepository {
  final ActorsDataSource dataSource;

  ActorMovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String idMovie) async {
    return dataSource.getActorsByMovie(idMovie);
  }

  @override
  Future<Person> getPersonInfoById({required String personId}) {
    return dataSource.getPersonInfoById(personId: personId);
  }
}

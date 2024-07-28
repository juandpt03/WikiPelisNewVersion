import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/infrastructure/datasources/actor_the_moviedb_datasource_impl.dart';
import 'package:wikipelis/infrastructure/repositorie/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider(
  (ref) => ActorMovieRepositoryImpl(ActorTheMovieDbDataSource()),
);

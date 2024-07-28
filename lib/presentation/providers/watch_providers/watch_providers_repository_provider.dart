import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/infrastructure/datasources/watch_providers_the_moviedb_datasource_impl.dart';
import 'package:wikipelis/infrastructure/repositorie/watch_providers_respository_impl.dart';

final watchRepositoryProvider = Provider((ref) {
  return WatchProvidersRespositoryImpl(WatchProvidersTheMoviedbDataSource());
});

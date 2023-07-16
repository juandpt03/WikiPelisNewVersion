import 'package:wikipelis/domain/datasources/watch_providers_datasource.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/domain/repositories/watch_providers_repository.dart';

class WatchProvidersRespositoryImpl extends WatchProvidersRepository {
  final WatchProvidersDataSource dataSource;

  WatchProvidersRespositoryImpl(this.dataSource);

  @override
  Future<List<WatchProvider>> getWatchProvidersByMovieId(
      {required String movieId}) {
    return dataSource.getWatchProvidersByMovieId(movieId: movieId);
  }
}

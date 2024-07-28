import 'package:wikipelis/domain/entities/entities.dart';

abstract class WatchProvidersDataSource {
  Future<List<WatchProvider>> getWatchProvidersByMovieId({
    required String movieId,
  });
}

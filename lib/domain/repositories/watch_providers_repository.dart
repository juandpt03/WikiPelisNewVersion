import 'package:wikipelis/domain/entities/entities.dart';

abstract class WatchProvidersRepository {
  Future<List<WatchProvider>> getWatchProvidersByMovieId({
    required String movieId,
  });
}

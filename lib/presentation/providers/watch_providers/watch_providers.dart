import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/presentation/providers/watch_providers/watch_providers_repository_provider.dart';

final watchProvider = FutureProvider.autoDispose
    .family<List<WatchProvider>, String>((ref, String movieId) async {
  return await ref
      .watch(watchRepositoryProvider)
      .getWatchProvidersByMovieId(movieId: movieId);
});

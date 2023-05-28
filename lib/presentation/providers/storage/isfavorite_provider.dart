import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final isFavoriteProvider =
    FutureProvider.autoDispose.family((ref, int movieId) async {
  final isFavorite =
      await ref.watch(localStorageRepositoryProvider).isMovieFavorite(movieId);
  return isFavorite;
});

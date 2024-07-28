// Peliculas por Id de persona
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/presentation/providers/movies/movies_repository_provider.dart';

final moviesPersonIdProvider = FutureProvider.family
    .autoDispose<List<Movie>, String>((ref, String personId) async {
  return await ref
      .watch(movieRepositoryProvider)
      .getMoviesByPersonId(personId: personId);
});

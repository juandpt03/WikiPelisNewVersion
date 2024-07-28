import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final movieTrailersProvider =
    StateNotifierProvider<MovieTrailersNotifier, List<MovieTrailers>>((
  ref,
) {
  final getMovieTrailers = ref.watch(movieRepositoryProvider);
  return MovieTrailersNotifier(
    getMovieTrailers: getMovieTrailers.getMovieTrailers,
  );
});

typedef GetMovieTrailersCallback = Future<List<MovieTrailers>> Function(
    {required String movieId});

class MovieTrailersNotifier extends StateNotifier<List<MovieTrailers>> {
  final GetMovieTrailersCallback getMovieTrailers;
  MovieTrailersNotifier({
    required this.getMovieTrailers,
  }) : super([]);

  Future<List<MovieTrailers>> loadTrailers(String movieId) async {
    List<MovieTrailers> movieTrailers =
        await getMovieTrailers(movieId: movieId);
    state = movieTrailers;
    return movieTrailers;
  }
}

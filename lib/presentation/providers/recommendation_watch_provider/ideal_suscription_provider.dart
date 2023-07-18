import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final idealSuscriptionProvider = StateNotifierProvider<
    MovieRecommendationNotifier, MovieRecommendationState>(
  (ref) {
    final listMoviesWatchProviders = listWatchProviders(ref);
    return MovieRecommendationNotifier(
        listMoviesWatchProviders: listMoviesWatchProviders);
  },
);

class MovieRecommendationNotifier
    extends StateNotifier<MovieRecommendationState> {
  final Future<List<List<WatchProvider>>> listMoviesWatchProviders;
  MovieRecommendationNotifier({required this.listMoviesWatchProviders})
      : super(MovieRecommendationState());

  void _addFavoriteWatchProvider(String provider) {
    if (state.providerFrequency.containsKey(provider)) {
      state.providerFrequency[provider] =
          state.providerFrequency[provider]! + 1;
    } else {
      state.providerFrequency[provider] = 1;
    }
  }

  Future<void> getRecommendedSubscription() async {
    String recommendedProvider = '';
    int maxFrequency = 0;

    state.providerFrequency.forEach((provider, frequency) {
      if (frequency > maxFrequency) {
        maxFrequency = frequency;
        recommendedProvider = provider;
      }
    });
    for (List<WatchProvider> watchProviders in await listMoviesWatchProviders) {
      for (WatchProvider watchProvider in watchProviders) {
        if (recommendedProvider == watchProvider.providerName) {
          state.recommendeWatchprovider = watchProvider;
          break;
        }
      }
    }
  }

  void addListWatchProvidersToState() async {
    for (List<WatchProvider> watchProviders in await listMoviesWatchProviders) {
      for (WatchProvider watchProvider in watchProviders) {
        _addFavoriteWatchProvider(watchProvider.providerName);
      }
    }
    getRecommendedSubscription();
  }
}

class MovieRecommendationState {
  Map<String, int> providerFrequency = {};
  WatchProvider? recommendeWatchprovider;
}

Future<List<List<WatchProvider>>> listWatchProviders(
    StateNotifierProviderRef<MovieRecommendationNotifier,
            MovieRecommendationState>
        ref) async {
  List<int> favoritesMovies = ref.watch(favoriteMoviesProvider).keys.toList();
  List<List<WatchProvider>>? watchProviders = [];
  for (int favoriteMovie in favoritesMovies) {
    final movieWatchProvider =
        ref.watch(moviesWatchProviders(favoriteMovie.toString()));
    movieWatchProvider.whenData((value) {
      if (value.isEmpty) return;
      watchProviders.add(value);
    });
  }
  if (watchProviders.isEmpty) return [];
  return watchProviders;
}

final moviesWatchProviders = FutureProvider.family<List<WatchProvider>, String>(
    (ref, String movieId) async {
  return await ref
      .watch(watchRepositoryProvider)
      .getWatchProvidersByMovieId(movieId: movieId);
});

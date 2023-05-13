import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

final initialLoadingProvider = Provider((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4 = ref.watch(upComingMoviesProvider).isEmpty;
  if (step1 || step2 || step3 || step4) return true;
  return false;
});

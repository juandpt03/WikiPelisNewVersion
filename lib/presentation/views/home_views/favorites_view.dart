import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/providers/recommendation_watch_provider/ideal_suscription_provider.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_favorites_masonry.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  Future<void> loadNextPage() async {
    if (isLastPage || isLoading) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) isLastPage = true;
  }

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMoviesProvider).values.toList();
    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.heart,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'Ohhh no!!',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            Text(
              S.of(context).noTienesPeliculasFavoritas,
              style: TextStyle(fontSize: 20, color: colors.secondary),
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: Text(
                S.of(context).comienzaAExplorar,
                style: TextStyle(color: colors.primary),
              ),
            )
          ],
        ),
      );
    }
    ref.watch(idealSuscriptionProvider.notifier).addListWatchProvidersToState();
    return Scaffold(
      bottomNavigationBar: ElevatedButton.icon(
        onPressed: () {
          openDialogIdealSuscription(context);
        },
        icon: const FaIcon(FontAwesomeIcons.display, size: 18),
        label: Text(S.of(context).subscripcionIdeal),
      ),
      body: MovieFavoritesMasonry(
        movies: movies,
        loadNextPage: loadNextPage,
      ),
    );
  }

  void openDialogIdealSuscription(BuildContext context) {
    final idealWatchProvider = ref.watch(idealSuscriptionProvider);
    final colors = Theme.of(context).colorScheme;
    final textStyleInformation =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
            );
    final textStyleTitle = Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold, color: colors.onBackground, fontSize: 21);
    final Size size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton.icon(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
            label: Text(
              S.of(context).salir,
            ),
          ),
        ],
        title: Text(
          S.of(context).subscripcionRecomendada,
          style: textStyleTitle,
        ),
        content: SizedBox(
          height: size.height * 0.2,
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                FadeIn(
                  child: Text(
                    idealWatchProvider.recommendeWatchprovider?.providerName ??
                        S
                            .of(context)
                            .ohhhNoEstasPeliculasNoEstanDisponiblesEnNingunaPlataforma,
                    style: textStyleInformation?.copyWith(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
                if (idealWatchProvider.recommendeWatchprovider?.providerName !=
                    null)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ZoomIn(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          idealWatchProvider.recommendeWatchprovider!.logoPath,
                          height: size.height * 0.1,
                          width: size.height * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

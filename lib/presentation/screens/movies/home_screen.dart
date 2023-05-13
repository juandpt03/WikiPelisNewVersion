import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // Creando la variable para escuchar el Loading
    final initialLoading = ref.watch(initialLoadingProvider);
    //Condición para retornar pantalla de carga
    if (initialLoading) return const FullScreenLoader();

    // Carga de Películas completada
    final slideShowMovies = ref.watch(movieSlidesShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 70,
          collapsedHeight: 70,
          floating: true,
          pinned: true,
          flexibleSpace: Container(
            color: colors.background,
            child: const CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MovieSlidesShow(movies: slideShowMovies),
                    MovieHorizontalListView(
                      movies: nowPlayingMovies,
                      title: 'En Cines',
                      subtitle: 'Lunes',
                      loadNextPage: () => ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    MovieHorizontalListView(
                      movies: upComingMovies,
                      title: 'Próximamente',
                      subtitle: 'En este mes',
                      loadNextPage: () => ref
                          .read(upComingMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    MovieHorizontalListView(
                      movies: popularMovies,
                      title: 'Populares',
                      loadNextPage: () => ref
                          .read(popularMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    MovieHorizontalListView(
                      movies: topRatedMovies,
                      title: 'Mejores Calificadas',
                      subtitle: 'Desde Siempre',
                      loadNextPage: () => ref
                          .read(topRatedMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

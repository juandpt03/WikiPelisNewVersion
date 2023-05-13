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
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(movieSlidesShowProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          pinned: true,
          flexibleSpace: CustomAppBar(),
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
                      movies: nowPlayingMovies,
                      title: 'Próximamente',
                      subtitle: 'En este mes',
                      loadNextPage: () => ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    MovieHorizontalListView(
                      movies: nowPlayingMovies,
                      title: 'Populares',
                      loadNextPage: () => ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage(),
                    ),
                    MovieHorizontalListView(
                      movies: nowPlayingMovies,
                      title: 'Mejores Calificadas',
                      subtitle: 'Desde Siempre',
                      loadNextPage: () => ref
                          .read(nowPlayingMoviesProvider.notifier)
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

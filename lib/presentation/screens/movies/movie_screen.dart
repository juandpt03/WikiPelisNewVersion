import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  final String movieId;
  static const String route = 'movie_screen';
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorInfoProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return Scaffold(
        backgroundColor: colors.onBackground,
        body: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _MovieDetails(movie: movie),
            ]),
          )
        ],
      ),
    );
  }
}

class _MovieDetails extends ConsumerWidget {
  const _MovieDetails({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context, ref) {
    final genres = ref.watch(moviesGenresProvider);
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: (size.width) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      movie.title,
                      style: textStyle.titleLarge!
                          .copyWith(color: colors.onBackground),
                    ),
                  ),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: textStyle.bodyLarge!
                        .copyWith(color: colors.onBackground),
                  ),
                ],
              ),
            )
          ],
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            ...movie.genreIds
                .map(
                  (genero) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        final String genreId = genres
                            .firstWhere((genre) => genre.name == genero)
                            .id;

                        context.push('/home/1/categories/$genreId');
                      },
                      child: Chip(
                        label: Text(
                          genero,
                          style: TextStyle(color: colors.onBackground),
                        ),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
        _ActorsByMovie(movieId: movie.id.toString())
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final actors = ref.watch(actorInfoProvider)[movieId];
    if (actors == null) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: actors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return Container(
            width: 135,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                actor.profilePath!.contains('https')
                    ? FadeInRight(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            actor.profilePath!,
                            height: 180,
                            width: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : FadeInRight(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            actor.profilePath!,
                            height: 180,
                            width: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Text(
                  actor.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colors.onBackground),
                ),
                Text(
                  actor.character ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomSliverAppBar extends ConsumerWidget {
  final Movie movie;
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(movie.id));

    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    // final textStyle = Theme.of(context).textTheme;
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () async {
            await ref
                .read(favoriteMoviesProvider.notifier)
                .toggleFavorite(movie);

            await Future.delayed(const Duration(milliseconds: 100));
            ref.invalidate(isFavoriteProvider(movie.id));
          },
          icon: isFavoriteFuture.when(
            data: (isFavorite) => isFavorite
                ? const FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  )
                : const FaIcon(FontAwesomeIcons.heart),
            error: (error, stackTrace) =>
                throw UnimplementedError(error.toString()),
            loading: () => const CircularProgressIndicator(strokeWidth: 2),
          ),
        )
      ],
      backgroundColor: colors.onBackground,
      expandedHeight: size.height * 0.65,
      foregroundColor: colors.onSecondary,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        centerTitle: true,
        // title: _title(textStyle, colors),
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) return const SizedBox.expand();
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text _title(TextTheme textStyle, ColorScheme colors) {
  //   return Text(
  //     movie.title,
  //     style: textStyle.headlineSmall?.copyWith(
  //       color: colors.onSecondary,
  //       fontSize: 20,
  //       overflow: TextOverflow.ellipsis,
  //     ),
  //     maxLines: 1,
  //   );
  // }
}

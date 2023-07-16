import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_poster_link.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  final bool? marginHorizontal;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
    this.marginHorizontal = true,
  });

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        if (widget.title != null || widget.subtitle != null)
          _Title(
            subtitle: widget.subtitle,
            title: widget.title,
            marginHorizontal: widget.marginHorizontal,
          ),
        SizedBox(
          height: size.height * 0.35,
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                child: _Slider(movie: widget.movies[index]),
              );
            },
          ),
        )
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 150,
        child: MoviePosterLink(movie: movie, height: size.height * 0.42),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? marginHorizontal;
  const _Title({this.title, this.subtitle, this.marginHorizontal = true});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: marginHorizontal!
          ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          : const EdgeInsets.symmetric(
              vertical: 10,
            ),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle!.copyWith(
                color: colors.onBackground,
              ),
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                visualDensity: VisualDensity.compact,
                elevation: const MaterialStatePropertyAll(20),
                surfaceTintColor: MaterialStatePropertyAll(colors.secondary),
              ),
              onPressed: null,
              child: Text(
                subtitle!,
                style: TextStyle(color: colors.onPrimary),
              ),
            ),
        ],
      ),
    );
  }
}

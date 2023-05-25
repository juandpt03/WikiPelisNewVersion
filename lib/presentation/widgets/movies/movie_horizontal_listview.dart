import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/config/helpers/human_formats.dart';
import 'package:wikipelis/domain/entities/movie.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

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
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(subtitle: widget.subtitle, title: widget.title),
          Expanded(
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
      ),
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
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // Poster
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  width: 150,
                  height: 250,
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const SizedBox(
                        width: 150,
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                        onTap: () => context.push('/home/0/movie/${movie.id}'),
                        child: FadeIn(child: child));
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),

          // Title

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 1,
              style: textStyle.titleSmall
                  ?.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),

          //Rating

          SizedBox(
            width: 150,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.starHalfStroke,
                  color: Colors.yellow.shade900,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade900),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyle.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
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

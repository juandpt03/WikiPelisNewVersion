import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/widgets/movies/movie_poster_link.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  ScrollController inifiniteScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    inifiniteScrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (inifiniteScrollController.position.pixels + 100 >=
          inifiniteScrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    inifiniteScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        scrollDirection: Axis.vertical,
        controller: inifiniteScrollController,
        itemCount: widget.movies.length,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                MoviePosterLink(movie: widget.movies[index]),
              ],
            );
          }
          return SizedBox(child: MoviePosterLink(movie: widget.movies[index]));
        },
      ),
    );
  }
}

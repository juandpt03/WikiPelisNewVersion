import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/domain/entities/movie.dart';

class MovieSlidesShow extends StatelessWidget {
  final List<Movie> movies;
  const MovieSlidesShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.28,
      child: Swiper(
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary.withValues(alpha: 0.6),
          ),
        ),
        viewportFraction: 0.85,
        autoplay: true,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
        scale: 0.9,
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
          decoration: decoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return _loadingMethod(loadingProgress, colors, child);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingMethod(
      ImageChunkEvent? loadingProgress, ColorScheme colors, Widget child) {
    if (loadingProgress != null) {
      return DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Center(
          child: CircularProgressIndicator(
            color: colors.primary.withValues(alpha: 0.5),
          ),
        ),
      );
    }
    return FadeIn(child: child);
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 10),
        )
      ],
    );
  }
}

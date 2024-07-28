import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/config/helpers/human_formats.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/providers/movies/movies_similar_provider.dart';

class MoviePosterLink extends ConsumerWidget {
  final Movie movie;
  final double height;

  const MoviePosterLink({super.key, required this.movie, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.push('/home/0/movie/${movie.id}');
        ref.invalidate(similarMoviesProvider);
      },
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: height * 0.65,
                child: Image.network(
                  height: height * 0.65,
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return Container(
                        height: height * 0.65,
                        decoration: _loadingImage(),
                        child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 1)),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            //Rating

            //title
            Text(
              movie.title,
              maxLines: 1,
              style: textStyle.titleSmall!.copyWith(
                  color: colors.onSurface, overflow: TextOverflow.ellipsis),
            ),

            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.starHalfStroke,
                  color: Colors.yellow.shade900,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  movie.voteAverage.toString().substring(0, 3),
                  style: textStyle.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade900),
                ),
                const Spacer(),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyle.bodySmall!.copyWith(color: colors.onSurface),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _loadingImage() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Colors.transparent,
          Colors.black54,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}

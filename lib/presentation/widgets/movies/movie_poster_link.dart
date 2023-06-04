import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/domain/entities/movie.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/home/0/movie/${movie.id}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          movie.posterPath,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return Container(
                height: 180,
                decoration: _loadingImage(),
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 1)),
              );
            }
            return FadeIn(child: child);
          },
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

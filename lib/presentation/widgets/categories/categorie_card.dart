import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wikipelis/domain/entities/genre.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class CategorieCard extends StatelessWidget {
  final Genre genre;
  final Movie movie;
  const CategorieCard({
    super.key,
    required this.genre,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _ImageCategory(movie: movie),
              const _BackgroundCategory(),
              _TextCategory(genre: genre),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextCategory extends StatelessWidget {
  const _TextCategory({
    required this.genre,
  });

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      left: 12,
      child: Text(
        genre.name,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BackgroundCategory extends StatelessWidget {
  const _BackgroundCategory();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      width: double.infinity,
      child: CustomBackgroundGradient(
        colors: [Colors.black87, Colors.transparent],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.8],
      ),
    );
  }
}

class _ImageCategory extends StatelessWidget {
  const _ImageCategory({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      movie.backdropPath,
      fit: BoxFit.cover,
      height: 200,
      width: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()));
        }
        return child;
      },
    );
  }
}

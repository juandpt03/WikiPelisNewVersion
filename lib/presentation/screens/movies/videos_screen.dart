import 'package:flutter/material.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class VideosScreen extends StatelessWidget {
  final String movieId;
  static const String route = 'videos_screen';
  const VideosScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).listaDeVideos),
      ),
      body: MovieTrailersBox(movieId: movieId),
    );
  }
}

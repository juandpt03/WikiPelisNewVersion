import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final String movieId;
  static const String route = 'movie_screen';
  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MovieScreen'),
      ),
    );
  }
}

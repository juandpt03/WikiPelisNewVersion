import 'package:flutter/material.dart';

class CustomBackgroundGradient extends StatelessWidget {
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;

  const CustomBackgroundGradient({
    super.key,
    required this.colors,
    required this.begin,
    required this.end,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
            stops: stops,
          ),
        ),
      ),
    );
  }
}

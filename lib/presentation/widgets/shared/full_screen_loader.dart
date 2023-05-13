import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere por favor'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator.adaptive(
            strokeWidth: 2,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

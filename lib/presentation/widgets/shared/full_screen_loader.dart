import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  Stream<String> getLoadingMessage() {
    List<String> messages = [
      'Cargando Películas',
      'Comprando Palomitas',
      'Cargando populares',
      'Llamando a mi novia',
      'Revisa tu conexión a internet',
      'Esto se puso extraño',
      'Ya meroooo',
      'Esto está tardando más de lo esperado',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator.adaptive(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}

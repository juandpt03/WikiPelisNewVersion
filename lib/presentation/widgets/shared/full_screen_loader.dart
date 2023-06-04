import 'package:flutter/material.dart';
import 'package:wikipelis/generated/l10n.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getLoadingMessage() {
      List<String> messages = [
        S.of(context).cargandoPeliculas,
        S.of(context).comprandoPalomitas,
        S.of(context).cargandoPopulares,
        S.of(context).llamandoAMiNovia,
        S.of(context).revisaTuConexionAInternet,
        S.of(context).estoSePusoExtrano,
        S.of(context).yaMeroooo,
        S.of(context).estoEstTardandoMsDeLoEsperado,
      ];
      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).esperePorFavor),
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
              if (!snapshot.hasData) return Text(S.of(context).cargando);
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}

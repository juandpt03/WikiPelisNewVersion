import 'package:flutter/material.dart';
import 'package:wikipelis/generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).configuraciones,
          style: textStyle.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: colors.onBackground,
          ),
        ),
      ),
      body: const Center(
        child: Text('SettingsView'),
      ),
    );
  }
}

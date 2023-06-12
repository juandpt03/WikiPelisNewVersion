import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/theme/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: isDarkMode!
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode)),
        ],
        title: Text(
          S.of(context).configuraciones,
          style: textStyle.headlineMedium!.copyWith(
            color: colors.onBackground,
          ),
        ),
      ),
      body: const Center(
          child: Column(
        children: [
          Text('SettingsView'),
        ],
      )),
    );
  }
}

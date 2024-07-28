import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/theme/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final subtextStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          color: colors.secondary,
        );

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    // create some values

    return Scaffold(
      appBar: AppBar(
        actions: [
          _ChangeDarkTheme(isDarkMode: isDarkMode),
        ],
        title: Text(
          S.of(context).configuraciones,
          style: textStyle.headlineMedium!.copyWith(
            color: colors.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CardThemeSettings(
                subtextStyle: subtextStyle, isDarkMode: isDarkMode),
          ],
        ),
      ),
    );
  }
}

class _CardThemeSettings extends ConsumerWidget {
  const _CardThemeSettings({
    required this.subtextStyle,
    required this.isDarkMode,
  });

  final TextStyle subtextStyle;
  final bool? isDarkMode;

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    Color? currentColor = Color(
        int.parse('0x${ref.watch(themeNotifierProvider).colorSchemeSeed}'));
    // ValueChanged<Color> callback
    void changeColor(Color color) {
      currentColor = color;
      ref
          .watch(themeNotifierProvider.notifier)
          .toggleTheme(color.value.toRadixString(16));
    }

    void colorPicker(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            S.of(context).selecioneSuColorFavorito,
            style: TextStyle(color: colors.secondary, fontSize: 21),
          ),
          content: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.52,
            child: ColorPicker(
              pickerColor: currentColor!,
              onColorChanged: changeColor,
              paletteType: PaletteType.hueWheel,
              labelTypes: const [],
            ),
          ),
          actions: [
            FilledButton.tonal(
              child: Text(
                S.of(context).aceptar,
                style: TextStyle(fontSize: 24, color: colors.secondary),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CardSection(
          title: S.of(context).ajustesDeTema,
          icon: Icons.colorize_sharp,
        ),
        TextButton.icon(
          onPressed: () => colorPicker(context),
          icon: const Icon(Icons.color_lens),
          label: Text(
            S.of(context).cambiarColorDeTema,
            style: subtextStyle,
          ),
        ),
        TextButton.icon(
          onPressed: () =>
              ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
          icon: isDarkMode!
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
          label: Text(
            S.of(context).modoLuzoscuridad,
            style: subtextStyle,
          ),
        ),
      ],
    );
  }
}

class _CardSection extends StatelessWidget {
  final IconData icon;
  final String title;
  const _CardSection({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      // margin: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Text(
          title,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          icon,
          color: colors.primary,
        ),
      ),
    );
  }
}

class _ChangeDarkTheme extends ConsumerWidget {
  const _ChangeDarkTheme({
    required this.isDarkMode,
  });

  final bool? isDarkMode;

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
        onPressed: () {
          ref.read(themeNotifierProvider.notifier).toggleDarkMode();
        },
        icon: isDarkMode!
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode));
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/config/theme/app_theme.dart';

//Un simple boolean
final isDarkModeProvider = StateProvider<bool>((isDarkMode) => true);
//Lista de colores inmutables

//Un simple entero
//StateNotifierProvider
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());
//Controller o Notifier

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}

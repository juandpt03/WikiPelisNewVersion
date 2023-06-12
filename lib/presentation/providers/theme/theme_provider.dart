import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/config/theme/app_theme.dart';
import 'package:wikipelis/domain/repositories/shared_preferences_repository.dart';
import 'package:wikipelis/presentation/providers/theme/settings_theme_respository.dart';

//StateNotifierProvider
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
    (ref) =>
        ThemeNotifier(repository: ref.watch(settingsThemeRepositoryProvider)));
//Controller o Notifier

class ThemeNotifier extends StateNotifier<AppTheme> {
  final SharedPreferencesRepository repository;
  ThemeNotifier({required this.repository}) : super(AppTheme()) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDarkMode = await repository.themeDark();
    state = AppTheme(isDarkMode: isDarkMode ?? true);
  }

  Future<void> toggleDarkMode() async {
    await repository.changeThemeDark(!state.isDarkMode!);
    state = state.copyWith(isDarkMode: await repository.themeDark());
  }
}

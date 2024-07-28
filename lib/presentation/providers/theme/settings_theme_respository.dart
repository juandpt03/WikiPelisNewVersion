import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/infrastructure/datasources/user_settings_datasource_impl.dart';
import 'package:wikipelis/infrastructure/repositorie/shared_preferences_repository.dart';

final settingsThemeRepositoryProvider = Provider(
    (ref) => SharedPreferencesRepositoryImpl(UserSettingsDataSourceimpl()));

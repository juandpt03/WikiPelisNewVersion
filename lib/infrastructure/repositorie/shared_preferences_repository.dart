import 'package:wikipelis/domain/datasources/shared_preferences_datasource.dart';
import 'package:wikipelis/domain/repositories/shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl extends SharedPreferencesRepository {
  final SharedPreferencesDatasource datasource;

  SharedPreferencesRepositoryImpl(this.datasource);

  @override
  Future<void> changeThemeDark(bool isDark) async {
    await datasource.changeThemeDark(isDark);
  }

  @override
  Future<bool?> themeDark() async {
    return await datasource.themeDark();
  }

  @override
  Future<void> changeColorTheme(String color) async {
    await datasource.changeColorTheme(color);
  }
}

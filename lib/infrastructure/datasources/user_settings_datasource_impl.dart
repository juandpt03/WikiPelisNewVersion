import 'package:shared_preferences/shared_preferences.dart';
import 'package:wikipelis/domain/datasources/shared_preferences_datasource.dart';

class UserSettingsDatasourceimpl extends SharedPreferencesDatasource {
  late Future<SharedPreferences> prefs;
  Future<SharedPreferences> initPrefs() async {
    return await SharedPreferences.getInstance();
  }

  UserSettingsDatasourceimpl() {
    prefs = initPrefs();
  }
  @override
  Future<void> changeThemeDark(bool isDark) async {
    final sharedPrefs = await prefs;
    await sharedPrefs.setBool('isDarkMode', isDark);
  }

  @override
  Future<bool?> themeDark() async {
    final sharedPrefs = await prefs;
    return sharedPrefs.getBool('isDarkMode');
  }

  @override
  Future<void> changeColorTheme(String color) async {
    final sharedPrefs = await prefs;
    await sharedPrefs.setString('colorTheme', color);
  }

  @override
  Future<String?> colorTheme() async {
    final sharedPrefs = await prefs;
    return sharedPrefs.getString('colorTheme');
  }
}

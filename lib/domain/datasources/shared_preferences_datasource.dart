abstract class SharedPreferencesDatasource {
  Future<bool?> themeDark();
  Future<void> changeThemeDark(bool isDark);
  Future<void> changeColorTheme(String color);
}

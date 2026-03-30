import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences prefs;
  StorageService(this.prefs);

  static const _tokenKey = 'auth_token';
  static const _themeKey = 'is_dark_mode';
  static const _langKey = 'language_code';
  static const _rememberMeKey = 'remember_me';

  Future<void> saveToken(String token) async => await prefs.setString(_tokenKey, token);
  String? getToken() => prefs.getString(_tokenKey);
  Future<void> deleteToken() async => await prefs.remove(_tokenKey);

  Future<void> setTheme(bool isDark) async => await prefs.setBool(_themeKey, isDark);
  bool getTheme() => prefs.getBool(_themeKey) ?? false;

  Future<void> setLanguage(String code) async => await prefs.setString(_langKey, code);
  String getLanguage() => prefs.getString(_langKey) ?? 'en';

  Future<void> setRememberMe(bool value) async => await prefs.setBool(_rememberMeKey, value);
  bool getRememberMe() => prefs.getBool(_rememberMeKey) ?? false;
}
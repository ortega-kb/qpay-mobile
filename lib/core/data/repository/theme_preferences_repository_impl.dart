import 'package:flutter/src/material/app.dart';
import 'package:qpay/core/domain/repository/theme_preferences_repository.dart';
import 'package:qpay/core/local/theme_preferences.dart';

class ThemePreferencesRepositoryImpl implements ThemePreferencesRepository {
  final ThemePreferences _themePreferences;

  ThemePreferencesRepositoryImpl({required ThemePreferences themePreferences})
      : _themePreferences = themePreferences;

  @override
  Future<void> clear() {
    return _themePreferences.clear();
  }

  @override
  Future<ThemeMode?> getTheme() {
    return _themePreferences.getTheme();
  }

  @override
  Future<void> saveTheme(ThemeMode theme) {
    return _themePreferences.saveTheme(theme);
  }
}

import 'package:flutter/material.dart';

abstract class ThemePreferencesRepository {
  Future<ThemeMode?> getTheme();
  Future<void> saveTheme(ThemeMode theme);
  Future<void> clear();
}

import 'package:flutter/material.dart';

abstract class ThemePreferences {
  Future<ThemeMode?> getTheme();
  Future<void> saveTheme(ThemeMode theme);
  Future<void> clear();
}

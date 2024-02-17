import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/theme_preferences_repository.dart';
import 'package:qpay/core/provider/theme_preferences_repository_provider.dart';

import 'color.dart';

final appThemeNotifierProvider = ChangeNotifierProvider(
    (ref) => AppTheme(ref.watch(themePreferencesRepositoryProvider)));

ThemeData get lightTheme {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Helvetica',
    scaffoldBackgroundColor: background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: background,
      backgroundColor: background,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: surface,
      selectedIconTheme: IconThemeData(color: primary),
      selectedLabelStyle: TextStyle(color: primary),
      unselectedIconTheme: IconThemeData(color: gray),
      unselectedLabelStyle: TextStyle(color: gray),
    ),
    cardColor: surface,
  );
}

ThemeData get darkTheme {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(color: black, surfaceTintColor: black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: black,
      selectedIconTheme: IconThemeData(color: surface),
      selectedLabelStyle: TextStyle(color: surface),
      unselectedIconTheme: IconThemeData(color: gray),
      unselectedLabelStyle: TextStyle(color: gray),
    ),
  );
}

/// AppTheme provides all functions for theme mode in Qpay application
/// AppTheme extends to ChangeNotifier from riverpod library
class AppTheme extends ChangeNotifier {
  AppTheme(this._repository);

  static const _defaultThemeMode = ThemeMode.system;
  final ThemePreferencesRepository _repository;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<ThemeMode> getThemeMode() async {
    return await _repository.getTheme() ?? _defaultThemeMode;
  }

  Future<void> changeToLightMode() async {
    _themeMode = ThemeMode.light;
    await _repository.saveTheme(_themeMode).whenComplete(notifyListeners);
  }

  Future<void> changeToDarkMode() async {
    _themeMode = ThemeMode.dark;
    await _repository.saveTheme(_themeMode).whenComplete(notifyListeners);
  }

  Future<void> changeToSystemMode() async {
    _themeMode = ThemeMode.system;
    await _repository.saveTheme(_themeMode).whenComplete(notifyListeners);
  }
}

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/src/material/app.dart';
import 'package:qpay/core/local/preferences.dart';
import 'package:qpay/core/local/theme_preferences.dart';

class ThemePreferencesImpl extends ThemePreferences {
  ThemePreferencesImpl(this._prefs);

  final Preferences _prefs;
  static const String key = "theme";

  @override
  Future<ThemeMode?> getTheme() async {
    final prefs = await _prefs.instance();
    return EnumToString.fromString(
      ThemeMode.values,
      prefs.getString(key) ?? EnumToString.convertToString(ThemeMode.system),
    );
  }

  @override
  Future<Future<bool>> saveTheme(ThemeMode theme) async {
    final prefs = await _prefs.instance();
    return prefs.setString(key, EnumToString.convertToString(theme));
  }

  @override
  Future<void> clear() async {
    final prefs = await _prefs.instance();
    prefs.clear();
  }
}

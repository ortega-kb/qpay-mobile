import 'package:qpay/core/local/language_preferences.dart';
import 'package:qpay/core/local/preferences.dart';

class LanguagePreferencesImpl extends LanguagePreferences {
  LanguagePreferencesImpl(this._prefs);

  final Preferences _prefs;
  static const String key = "lang";

  @override
  Future<void> clear() async {
    final prefs = await _prefs.instance();
    prefs.clear();
  }

  @override
  Future<String> getLanguage() async {
    final prefs = await _prefs.instance();
    return prefs.getString(key) ?? "fr";
  }

  @override
  Future<void> saveLanguage(String lang) async {
    final prefs = await _prefs.instance();
    prefs.setString(key, lang);
  }
}

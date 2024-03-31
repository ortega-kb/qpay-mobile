import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/domain/repository/language_preferences.dart';
import 'package:qpay/core/local/preferences.dart';
import 'package:qpay/core/provider/language_provider.dart';
import 'package:qpay/core/utils/enums/language.dart';

class LanguagePreferencesImpl extends LanguagePreferences {
  LanguagePreferencesImpl(this._prefs, this._ref);

  final Preferences _prefs;
  final Ref _ref;

  static const String key = "lang";

  @override
  Future<void> clear() async {
    final prefs = await _prefs.instance();
    prefs.clear();
  }

  @override
  Future<Language> getLanguage() async {
    final prefs = await _prefs.instance();
    final code = prefs.getString(key);

    for (var value in Language.values) {
      if (value.code == code) return value;
    }
    return Language.French;
  }

  @override
  Future<void> saveLanguage(Language language) async {
    final prefs = await _prefs.instance();
    await prefs.setString(key, language.code);
    _ref.read(languageProvider.notifier).update((_) => language);
  }
}

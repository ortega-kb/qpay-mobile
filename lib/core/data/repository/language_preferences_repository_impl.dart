import 'package:qpay/core/data/repository/language_preferences_repository.dart';
import 'package:qpay/core/local/language_preferences.dart';

class LanguagePreferencesRepositoryImpl
    implements LanguagePreferencesRepository {
  final LanguagePreferences _languagePreferences;

  LanguagePreferencesRepositoryImpl(
      {required LanguagePreferences languagePreferences})
      : _languagePreferences = languagePreferences;

  @override
  Future<void> clear() {
    return _languagePreferences.clear();
  }

  @override
  Future<String> getLanguage() {
    return _languagePreferences.getLanguage();
  }

  @override
  Future<void> saveLanguage(String lang) {
    return _languagePreferences.saveLanguage(lang);
  }
}

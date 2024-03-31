import 'package:qpay/core/domain/repository/language_preferences.dart';
import 'package:qpay/core/domain/repository/language_preferences_repository.dart';
import 'package:qpay/core/utils/enums/language.dart';

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
  Future<Language> getLanguage() {
    return _languagePreferences.getLanguage();
  }

  @override
  Future<void> saveLanguage(Language language) {
    return _languagePreferences.saveLanguage(language);
  }
}

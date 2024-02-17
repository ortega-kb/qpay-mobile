abstract class LanguagePreferencesRepository {
  Future<String> getLanguage();
  Future<void> saveLanguage(String lang);
  Future<void> clear();
}

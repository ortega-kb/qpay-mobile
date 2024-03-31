import 'package:qpay/core/utils/enums/language.dart';

abstract class LanguagePreferencesRepository {
  Future<Language> getLanguage();
  Future<void> saveLanguage(Language language);
  Future<void> clear();
}

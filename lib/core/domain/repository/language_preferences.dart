import 'package:qpay/core/utils/enums/language.dart';

abstract class LanguagePreferences {
  Future<Language> getLanguage();
  Future<void> saveLanguage(Language language);
  Future<void> clear();
}

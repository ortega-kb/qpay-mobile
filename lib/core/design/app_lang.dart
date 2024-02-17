import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/language_preferences_repository.dart';
import 'package:qpay/core/provider/language_preferences_repository_provider.dart';

final appLangNotifierProvider = ChangeNotifierProvider<AppLang>(
    (ref) => AppLang(ref.watch(languagePreferencesRepositoryProvider)));

/// AppLang provides all functions for change language in Qpay application
/// AppLang extends ChangeNotifier from riverpod library
class AppLang with ChangeNotifier {
  AppLang(this._repository);

  final LanguagePreferencesRepository _repository;

  Future<String> getLang() async {
    return await _repository.getLanguage();
  }

  Future<void> changeToFr(BuildContext context) async {
    await _repository.saveLanguage("fr").whenComplete(notifyListeners);
  }

  Future<void> changeToEn(BuildContext context) async {
    await _repository.saveLanguage("en").whenComplete(notifyListeners);
  }
}

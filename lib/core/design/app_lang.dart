import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/language_preferences_repository.dart';
import 'package:qpay/core/provider/language_preferences_repository_provider.dart';

final appLangNotifierProvider = StateNotifierProvider<AppLang, String>(
    (ref) => AppLang(ref.watch(languagePreferencesRepositoryProvider)));

/// AppLang provides all functions for change language in Qpay application
/// AppLang extends ChangeNotifier from riverpod library
class AppLang extends StateNotifier<String> {
  AppLang(this._repository) : super("fr");

  final LanguagePreferencesRepository _repository;

  Future<void> getLang() async {
    state = await _repository.getLanguage();
  }

  Future<void> changeToFr(BuildContext context) async {
    state = "fr";
    await _repository.saveLanguage("fr");
  }

  Future<void> changeToEn(BuildContext context) async {
    state = "en";
    await _repository.saveLanguage("en");
  }
}

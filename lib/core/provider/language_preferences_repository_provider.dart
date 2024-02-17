import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/language_preferences_repository.dart';
import 'package:qpay/core/data/repository/language_preferences_repository_impl.dart';
import 'package:qpay/core/provider/language_preferences_provider.dart';

final languagePreferencesRepositoryProvider =
    Provider<LanguagePreferencesRepository>((ref) =>
        LanguagePreferencesRepositoryImpl(
            languagePreferences: ref.watch(languagePreferencesProvider)));

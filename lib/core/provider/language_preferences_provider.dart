import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/language_preferences_impl.dart';
import 'package:qpay/core/domain/repository/language_preferences.dart';
import 'package:qpay/core/provider/preferences_provider.dart';

final languagePreferencesProvider = Provider<LanguagePreferences>(
  (ref) => LanguagePreferencesImpl(ref.watch(preferencesProvider), ref),
);

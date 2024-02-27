import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/theme_preferences_provider.dart';

import '../data/repository/theme_preferences_repository_impl.dart';

final themePreferencesRepositoryProvider = Provider(
  (ref) => ThemePreferencesRepositoryImpl(
    themePreferences: ref.watch(themePreferencesProvider),
  ),
);

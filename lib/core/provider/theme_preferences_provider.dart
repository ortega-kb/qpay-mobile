import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/preferences_provider.dart';

import '../data/repository/theme_preferences_impl.dart';
import '../domain/repository/theme_preferences.dart';

final themePreferencesProvider = Provider<ThemePreferences>(
    (ref) => ThemePreferencesImpl(ref.watch(preferencesProvider)));

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/preferences_provider.dart';

import '../local/theme_preferences.dart';
import '../local/theme_preferences_impl.dart';

final themePreferencesProvider = Provider<ThemePreferences>(
    (ref) => ThemePreferencesImpl(ref.watch(preferencesProvider)));

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/local/theme_preferences.dart';
import 'package:qpay/core/local/theme_preferences_impl.dart';
import 'package:qpay/core/provider/preferences_provider.dart';

final themePreferencesProvider = Provider<ThemePreferences>(
    (ref) => ThemePreferencesImpl(ref.watch(preferencesProvider)));

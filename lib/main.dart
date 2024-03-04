import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl_standalone.dart'
if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:qpay/core/design/app_theme.dart';
import 'package:qpay/core/provider/language_preferences_repository_provider.dart';
import 'package:qpay/core/provider/messaging_service_provider.dart';
import 'package:qpay/feature/account/public_account_screen.dart';
import 'package:qpay/feature/success/account_success_creation_screen.dart';
import 'package:qpay/feature/type_of_account/type_of_account.dart';
import 'package:qpay/wrapper.dart';

import 'core/utils/enums/language.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final container = ProviderContainer();
  await container.read(messagingServiceProvider).initMessaging();

  final language =
      await container.read(languagePreferencesRepositoryProvider).getLanguage();

  runApp(
    ProviderScope(
      overrides: [languageProvider.overrideWith((ref) => language)],
      child: QPayApp(),
    ),
  );
}

class QPayApp extends ConsumerWidget {
  const QPayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qpay',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('fr'), // French
        Locale('en'), // English
      ],
      locale: Locale(language.code),
      theme: lightTheme,
      darkTheme: darkTheme,
      home: AccountSuccessCreationScreen(),
    );
  }
}

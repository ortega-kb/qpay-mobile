import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qpay/core/design/app_theme.dart';
import 'package:qpay/core/domain/model/qr_static_model.dart';
import 'package:qpay/core/provider/language_preferences_repository_provider.dart';
import 'package:qpay/core/provider/language_provider.dart';
import 'package:qpay/core/provider/messaging_service_provider.dart';
import 'package:qpay/feature/index/index_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

  // init screen orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // init hive
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  await Hive.openBox<QRStaticModel>("qrStatic");

  // init env file
  await dotenv.load();

  // init firebase platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // init fcm service
  final container = ProviderContainer();
  await container.read(messagingServiceProvider).initMessaging();

  // get preference language
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
      home: IndexScreen(),
    );
  }
}

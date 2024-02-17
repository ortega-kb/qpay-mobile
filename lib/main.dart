import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/app_theme.dart';
import 'package:qpay/feature/auth/screen/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Locales.init(['fr', 'en']);

  //final Wrapper _wrapper = Wrapper();
  //final bool isLogged = await _wrapper.isLogged();

  runApp(
    ProviderScope(
      child: QPayApp(
        initialRoute: true ? null : null,
      ),
    ),
  );
}

class QPayApp extends ConsumerWidget {
  final Widget? initialRoute;

  const QPayApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LocaleBuilder(
      builder: (locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qpay',
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: LoginScreen(),
        );
      },
    );
  }
}

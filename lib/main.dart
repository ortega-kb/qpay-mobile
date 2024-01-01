import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/language/language_view_model.dart';
import 'package:qpay/features/main/main_view_model.dart';
import 'package:qpay/features/welcome/welcome_view_model.dart';
import 'package:qpay/routing/app_router.dart';
import 'package:qpay/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['fr', 'en']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
        ChangeNotifierProvider(create: (_) => WelcomeViewModel()),
        ChangeNotifierProvider(create: (_) => MainViewModel())
      ],
      child: LocaleBuilder(
        builder: (locale) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Qpay',
            localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Helvetica',
              scaffoldBackgroundColor: white,
              appBarTheme: const AppBarTheme(
                  surfaceTintColor: white, backgroundColor: white),
            ),
            routerConfig: AppRouter().goRouter,
          );
        },
      ),
    );
  }
}

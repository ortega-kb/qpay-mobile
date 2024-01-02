import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/home_view_model.dart';
import 'package:qpay/features/language/language_view_model.dart';
import 'package:qpay/provider/main_navigation_provider.dart';
import 'package:qpay/provider/sold_provider.dart';
import 'package:qpay/provider/welcome_page_provider.dart';
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
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => MainNavigationProvider()),
        ChangeNotifierProvider(create: (_) => WelcomePageProvider()),
        ChangeNotifierProvider(create: (_) => SoldProvider()),
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
                surfaceTintColor: white,
                backgroundColor: white,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 1,
                backgroundColor: white,
                selectedIconTheme: IconThemeData(color: orange),
                selectedLabelStyle: TextStyle(color: orange),
                unselectedIconTheme: IconThemeData(color: gray),
                unselectedLabelStyle: TextStyle(color: gray)
              )
            ),
            routerConfig: AppRouter().goRouter,
          );
        },
      ),
    );
  }
}

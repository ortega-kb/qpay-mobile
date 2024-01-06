import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/home_view_model.dart';
import 'package:qpay/features/language/language_view_model.dart';
import 'package:qpay/features/themes/themes_view_model.dart';
import 'package:qpay/provider/main_navigation_provider.dart';
import 'package:qpay/provider/register_step_provider.dart';
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
        // viewModel
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ThemesViewModel()),

        // provider
        ChangeNotifierProvider(create: (_) => MainNavigationProvider()),
        ChangeNotifierProvider(create: (_) => WelcomePageProvider()),
        ChangeNotifierProvider(create: (_) => SoldProvider()),
        ChangeNotifierProvider(create: (_) => RegisterStepProvider()),
      ],
      child: LocaleBuilder(
        builder: (locale) {
          return Consumer<ThemesViewModel>(
            builder: (context, viewModel, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Qpay',
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                themeMode: viewModel.selectedTheme,
                theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'Helvetica',
                  scaffoldBackgroundColor: background,
                  appBarTheme: const AppBarTheme(
                      surfaceTintColor: background,
                      backgroundColor: background
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 1,
                    backgroundColor: surface,
                    selectedIconTheme: IconThemeData(color: primary),
                    selectedLabelStyle: TextStyle(color: primary),
                    unselectedIconTheme: IconThemeData(color: gray),
                    unselectedLabelStyle: TextStyle(color: gray),
                  ),
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'Helvetica'
                ),
                routerConfig: AppRouter().goRouter,
              );
            },
          );
        },
      ),
    );
  }
}

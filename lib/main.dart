import 'dart:io' show Platform;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/data/services/auth_service.dart';
import 'package:qpay/features/home/home_view_model.dart';
import 'package:qpay/features/language/language_view_model.dart';
import 'package:qpay/features/themes/themes_view_model.dart';
import 'package:qpay/providers/balance_page_provider.dart';
import 'package:qpay/providers/dropdown_currency_provider.dart';
import 'package:qpay/providers/dropdown_network_provider.dart';
import 'package:qpay/providers/main_navigation_provider.dart';
import 'package:qpay/providers/qr_scanner_provider.dart';
import 'package:qpay/providers/register_step_marchand_provider.dart';
import 'package:qpay/providers/register_step_provider.dart';
import 'package:qpay/providers/welcome_page_provider.dart';
import 'package:qpay/routing/app_router.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Locales.init(['fr', 'en']);
  Platform.isAndroid
      ? await Firebase.initializeApp()
      : await Firebase.initializeApp();

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
        ChangeNotifierProvider(create: (_) => BalancePageProvider()),
        ChangeNotifierProvider(create: (_) => RegisterStepProvider()),
        ChangeNotifierProvider(create: (_) => QrScannerProvider()),
        ChangeNotifierProvider(create: (_) => DropdownCurrencyProvider()),
        ChangeNotifierProvider(create: (_) => DropdownNetworkProvider()),
        ChangeNotifierProvider(create: (_) => RegisterStepMarchandProvider()),

        // service
        Provider(create: (_) => AuthService())
      ],
      child: LocaleBuilder(
        builder: (locale) {
          return Consumer<ThemesViewModel>(
            builder: (context, viewModel, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Qpay',
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                themeMode: viewModel.selectedTheme,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: AppRoutes.welcome,
                theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'Helvetica',
                  scaffoldBackgroundColor: background,
                  appBarTheme: const AppBarTheme(
                    surfaceTintColor: background,
                    backgroundColor: background,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 1,
                    backgroundColor: surface,
                    selectedIconTheme: IconThemeData(color: primary),
                    selectedLabelStyle: TextStyle(color: primary),
                    unselectedIconTheme: IconThemeData(color: gray),
                    unselectedLabelStyle: TextStyle(color: gray),
                  ),
                  cardColor: surface,
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: black,
                  appBarTheme:
                      AppBarTheme(color: black, surfaceTintColor: black),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 1,
                    backgroundColor: black,
                    selectedIconTheme: IconThemeData(color: surface),
                    selectedLabelStyle: TextStyle(color: surface),
                    unselectedIconTheme: IconThemeData(color: gray),
                    unselectedLabelStyle: TextStyle(color: gray),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

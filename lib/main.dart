import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/presentation/language/language_screen.dart';
import 'package:qpay/presentation/welcome/welcome_screen.dart';
import 'package:qpay/provider/language_provider.dart';
import 'package:qpay/provider/welcome_provider.dart';
import 'package:qpay/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WelcomeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qpay',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Helvetica',
            scaffoldBackgroundColor: white,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: white,
              backgroundColor: white
            ),
          ),
          home: const LanguageScreen()
      )
    );
  }
}

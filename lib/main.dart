import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/language/language_screen.dart';
import 'package:qpay/provider/language_provider.dart';
import 'package:qpay/provider/welcome_provider.dart';
import 'package:qpay/routing/app_router.dart';
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
      ],
      child: MaterialApp.router(
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
          routerConfig: AppRouter().goRouter,
      )
    );
  }
}

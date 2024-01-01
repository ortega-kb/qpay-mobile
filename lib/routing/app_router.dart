import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/features/language/language_screen.dart';
import 'package:qpay/features/main/main_screen.dart';
import 'package:qpay/features/welcome/welcome_screen.dart';
import 'package:qpay/routing/app_routes.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.main,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (BuildContext context, GoRouterState state) {
          return WelcomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (BuildContext context, GoRouterState state) {
          return LanguageScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (BuildContext context, GoRouterState state) {
          return MainScreen();
        },
      )
    ],
  );
}

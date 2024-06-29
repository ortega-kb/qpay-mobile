import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/home_screen.dart';

class AppRouterConfig {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Column();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return Column();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return Column();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.surface,
            ),
            child: HomeScreen(),
          );
        },
      )
    ],
  );
}

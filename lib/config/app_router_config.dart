import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:qpay/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:qpay/features/home_screen.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';

class AppRouterConfig {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/on-boarding',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Column();
        },
      ),
      GoRoute(
        path: '/on-boarding',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: OnBoardingScreen(),
          );
        },
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: SignUpScreen(),
          );
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

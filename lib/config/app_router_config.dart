import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/messages.dart';

class AppRouterConfig {
  late final router = GoRouter(
    initialLocation: '/',
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
          return Column();
        },
      )
    ],
  );
  
}

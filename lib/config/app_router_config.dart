import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:qpay/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:qpay/features/home_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_scanner_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/add_transaction_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/link_generator_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/transaction_list_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/add_wallet_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_list_screen.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';

class AppRouterConfig {
  late final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.surface,
            ),
            child: HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            path: 'wallet-list',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: WalletListScreen(),
              );
            },
          ),
          GoRoute(
            path: 'add-wallet',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: AddWalletScreen(),
              );
            },
          ),
          GoRoute(
            path: 'add-transaction',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: AddTransactionScreen(),
              );
            },
          ),
          GoRoute(
            path: 'transaction-list',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: TransactionListScreen(),
              );
            },
          ),
          GoRoute(
            path: 'qr-scanner',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: QrScannerScreen(),
              );
            },
          ),
          GoRoute(
            path: 'link-generator',
            builder: (context, state) {
              return const AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: LinkGeneratorScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        redirect: (context, state) => '/',
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
    ],
  );
}

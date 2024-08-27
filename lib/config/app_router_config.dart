import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:qpay/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:qpay/features/auth/presentation/screens/user_information_screen.dart';
import 'package:qpay/features/auth/presentation/screens/verify_phone_number_screen.dart';
import 'package:qpay/features/dashboard/presentation/screens/reports_screen.dart';
import 'package:qpay/features/home_screen.dart';
import 'package:qpay/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_scanner_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_static_detail_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/add_transaction_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/link_generator_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/transaction_list_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_list_screen.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';

class AppRouterConfig {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/on-boarding',
    navigatorKey: _rootNavigatorKey,
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
      ),
      GoRoute(
        path: '/wallet-list',
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
        path: '/payment',
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
        path: '/notifications',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: NotificationsScreen(),
          );
        },
      ),
      GoRoute(
        path: '/qr-static-details',
        builder: (context, state) {
          final qrStatic = state.extra as QRStatic;
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: QRStaticDetailScreen(qrStatic: qrStatic),
          );
        },
      ),
      GoRoute(
        path: '/add-transaction',
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
        path: '/transaction-list',
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
        path: '/qr-scanner',
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
        path: '/link-generator',
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
      GoRoute(
        path: '/reports-transaction',
        builder: (context, state) {
          return const AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: ReportsScreen(),
          );
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
        path: '/verify-phone-number',
        builder: (context, state) {
          String phone = state.extra.toString();
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: VerifyPhoneNumberScreen(phone: phone),
          );
        },
      ),
      GoRoute(
        path: '/user-informations',
        builder: (context, state) {
          final phone = state.extra.toString();
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: AppColor.background,
              systemNavigationBarColor: AppColor.background,
            ),
            child: UserInformationScreen(phone: phone),
          );
        },
      ),
    ],
  );
}

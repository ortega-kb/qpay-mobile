import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/services/shared_preferences_service.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/qr_response.dart';
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
import 'package:qpay/features/transaction/presentation/screens/transaction_screen.dart';
import 'package:qpay/features/transaction/presentation/screens/transaction_list_screen.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_details_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_list_screen.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';

class AppRouterConfig {
  SharedPreferencesService _sharedPreferencesService;

  AppRouterConfig(this._sharedPreferencesService);

  GoRouter get router => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/on-boarding',
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
                path: 'transaction',
                builder: (context, state) {
                  final response = LinkUtil.extractLinkData(state.uri);
                  return AnnotatedRegion(
                    value: SystemUiOverlayStyle(
                      statusBarColor: AppColor.background,
                      systemNavigationBarColor: AppColor.background,
                    ),
                    child: PopScope(
                      onPopInvoked: (value) {
                        context.go('/');
                      },
                      child: TransactionScreen(
                        transactionResponse: response,
                      ),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'notifications',
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
                path: 'qr-static-details',
                builder: (context, state) {
                  final qrStaticDecoded = json.decode(state.extra as String);
                  final QRStatic qrStatic = QRStatic.fromJson(qrStaticDecoded);
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
                path: 'add-transaction',
                builder: (context, state) {
                  return AnnotatedRegion(
                    value: SystemUiOverlayStyle(
                      statusBarColor: AppColor.background,
                      systemNavigationBarColor: AppColor.background,
                    ),
                    child: PopScope(
                      onPopInvoked: (value) {
                        context.pop();
                      },
                      child: AddTransactionScreen(),
                    ),
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
                path: 'reports-transaction',
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
                path: 'wallet-details',
                builder: (context, state) {
                  final walletDecoded = json.decode(state.extra as String);
                  final Wallet wallet = Wallet.fromJson(walletDecoded);

                  return AnnotatedRegion(
                    value: SystemUiOverlayStyle(
                      statusBarColor: AppColor.background,
                      systemNavigationBarColor: AppColor.background,
                    ),
                    child: WalletDetailsScreen(wallet: wallet),
                  );
                },
              ),
            ]
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
        redirect: (context, state) {
          bool isAuthenticated = _sharedPreferencesService.userAuthenticated;

          // If user is authenticated but try to access sign-in or sign-up screen,
          // redirect to home page
          if (isAuthenticated &&
              (state.matchedLocation == '/sign-in' ||
                  state.matchedLocation == '/sign-up' ||
                  state.matchedLocation == '/on-boarding')) {
            return '/';
          }

          // If user is not authenticated but try to access /transaction screen
          // redirect to /on-boarding
          if (!isAuthenticated && (state.matchedLocation == '/transaction')) {
            return '/on-boarding';
          }

          // If user is not authenticated but try to access / screen
          // redirect to /on-boarding
          if (!isAuthenticated && (state.matchedLocation == '/')) {
            return '/on-boarding';
          }

          // If user is authenticated but try to access /transaction via link
          if (isAuthenticated && (state.matchedLocation == '/transaction')) {
            // If link not is valid
            // redirect to /
            if (!LinkUtil.validateLink(state.uri.toString())) return '/';
            else return null;
          }
          return null;
        },
      );
}

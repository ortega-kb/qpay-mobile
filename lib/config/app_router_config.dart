import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:qpay/config/app_route_name.dart';
import 'package:qpay/core/shared/services/shared_preferences_service.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/qr_response.dart';
import 'package:qpay/features/auth/presentation/screens/screens.dart';
import 'package:qpay/features/dashboard/presentation/screens/reports_screen.dart';
import 'package:qpay/features/home_screen.dart';
import 'package:qpay/features/language/presentation/screens/language_screen.dart';
import 'package:qpay/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/screens.dart';
import 'package:qpay/features/transaction/presentation/screens/screens.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/presentation/screens/screens.dart';

import 'package:qpay/di/di.dart';
import '../features/qr_code/domain/entities/qr_static.dart';

class AppRouterConfig {
  SharedPreferencesService _sharedPreferencesService;

  AppRouterConfig(this._sharedPreferencesService);

  GoRouter get router => GoRouter(
        debugLogDiagnostics: true,
        initialLocation: AppRouteName.root,
        routes: [
          GoRoute(
            path: AppRouteName.root,
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
            path: AppRouteName.walletListScreen,
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
            path: AppRouteName.transactionQrCodeScreen,
            builder: (context, state) {
              final qrResponse = json.decode(state.extra as String);
              final response = TransactionResponse.fromJson(qrResponse);

              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: PopScope(
                  onPopInvoked: (value) {
                    context.go(AppRouteName.root);
                  },
                  child: TransactionScreen(
                    transactionResponse: response,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: AppRouteName.transactionScreen,
            builder: (context, state) {
              final response = LinkUtil.extractLinkData(state.uri);
              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: PopScope(
                  onPopInvoked: (value) {
                    context.go(AppRouteName.root);
                  },
                  child: TransactionScreen(
                    transactionResponse: response,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: AppRouteName.notificationScreen,
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
            path: AppRouteName.qrStaticDetailsScreen,
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
            path: AppRouteName.addTransactionScreen,
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
            path: AppRouteName.transactionListScreen,
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
            path: AppRouteName.qrScannerScreen,
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
            path: AppRouteName.reportsTransactionScreen,
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
            path: AppRouteName.walletDetailsScreen,
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
          GoRoute(
            path: AppRouteName.onBoardingScreen,
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
            path: AppRouteName.signInScreen,
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
            path: AppRouteName.signUpScreen,
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
            path: AppRouteName.verifyPhoneNumberScreen,
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
            path: AppRouteName.userInformationsScreen,
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
          GoRoute(
            path: AppRouteName.myQrCodeScreen,
            builder: (context, state) {
              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: MyQrCodeScreen(),
              );
            },
          ),
          GoRoute(
            path: AppRouteName.accountScreen,
            builder: (context, state) {
              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: AccountScreen(),
              );
            },
          ),
          GoRoute(
            path: AppRouteName.languageScreen,
            builder: (context, state) {
              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor: AppColor.background,
                  systemNavigationBarColor: AppColor.background,
                ),
                child: LanguageScreen(),
              );
            },
          ),
        ],
        redirect: (context, state) {
          bool isAuthenticated = _sharedPreferencesService.userAuthenticated;

          // If user is authenticated but try to access sign-in or sign-up screen,
          // redirect to home page
          if (isAuthenticated &&
              (state.matchedLocation == AppRouteName.signInScreen ||
                  state.matchedLocation == AppRouteName.signUpScreen ||
                  state.matchedLocation == AppRouteName.onBoardingScreen)) {
            return AppRouteName.root;
          }

          // If user is not authenticated but try to access /transaction screen
          // redirect to /on-boarding
          if (!isAuthenticated && (state.matchedLocation == AppRouteName.transactionScreen)) {
            locator<Logger>().d('query params ${state.uri.queryParameters}');
            return AppRouteName.onBoardingScreen;
          }

          // If user is not authenticated but try to access / screen
          // redirect to /on-boarding
          if (!isAuthenticated && (state.matchedLocation == AppRouteName.root)) {
            return AppRouteName.onBoardingScreen;
          }

          // If user is authenticated but try to access /transaction via link
          if (isAuthenticated && (state.matchedLocation == AppRouteName.transactionScreen)) {
            // If link not is valid
            // redirect to /
            if (!LinkUtil.validateLink(state.uri.toString())) {
              locator<Logger>().d('invalid link ${state.uri.queryParameters}');
              return '/';
            } else {
              return null;
            }
          }
          return null;
        },
      );
}

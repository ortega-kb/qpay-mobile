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
import 'package:qpay/features/customized_logo/presentation/screen/customized_logo_screen.dart';
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

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouterConfig {
  SharedPreferencesService _sharedPreferencesService;

  AppRouterConfig(this._sharedPreferencesService);

  GoRouter get router => GoRouter(
        navigatorKey: _navigatorKey,
        debugLogDiagnostics: true,
        initialLocation: AppRouteName.root,
        routes: [
          GoRoute(
            path: HomeScreen.route,
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
                path: WalletListScreen.path,
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
                path: AccountScreen.path,
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
                path: LanguageScreen.path,
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
              GoRoute(
                path: MyQrCodeScreen.path,
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
                path: AppRouteName.transactionQrCodePath,
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
                        context.go(HomeScreen.route);
                      },
                      child: TransactionScreen(
                        transactionResponse: response,
                      ),
                    ),
                  );
                },
              ),
              GoRoute(
                path: TransactionScreen.path,
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
                path: NotificationsScreen.path,
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
                path: QRStaticDetailScreen.path,
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
                path: AddTransactionScreen.path,
                builder: (context, state) {
                  TransactionResponse? transactionResponse = null;
                  if (state.extra != null) {
                    final transactionDecoded =
                        json.decode(state.extra as String);
                    transactionResponse =
                        TransactionResponse.fromJson(transactionDecoded);
                  }

                  return AnnotatedRegion(
                    value: SystemUiOverlayStyle(
                      statusBarColor: AppColor.background,
                      systemNavigationBarColor: AppColor.background,
                    ),
                    child: PopScope(
                      onPopInvoked: (value) {
                        if (transactionResponse != null) {
                          context.go(HomeScreen.route);
                        }
                      },
                      child: AddTransactionScreen(
                        transactionResponse: transactionResponse,
                      ),
                    ),
                  );
                },
              ),
              GoRoute(
                path: TransactionListScreen.path,
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
                path: QrScannerScreen.path,
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
                path: ReportsScreen.path,
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
                path: WalletDetailsScreen.path,
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
                path: CustomizedLogoScreen.path,
                builder: (context, state) {
                  return AnnotatedRegion(
                    value: SystemUiOverlayStyle(
                      statusBarColor: AppColor.background,
                      systemNavigationBarColor: AppColor.background,
                    ),
                    child: CustomizedLogoScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: OnBoardingScreen.path,
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
            path: SignInScreen.path,
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
            path: SignUpScreen.path,
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
            path: VerifyPhoneNumberScreen.path,
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
            path: UserInformationScreen.path,
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
              (state.matchedLocation == SignInScreen.route ||
                  state.matchedLocation == SignUpScreen.route ||
                  state.matchedLocation == OnBoardingScreen.route)) {
            return HomeScreen.route;
          }

          // If user is not authenticated but try to access /transaction screen
          // redirect to /on-boarding
          if (!isAuthenticated &&
              (state.matchedLocation == TransactionScreen.route)) {
            sl<Logger>().d('query params ${state.uri.queryParameters}');
            return OnBoardingScreen.route;
          }

          // If user is not authenticated but try to access / screen
          // redirect to /on-boarding
          if (!isAuthenticated && (state.matchedLocation == HomeScreen.route)) {
            return OnBoardingScreen.route;
          }

          // If user is authenticated but try to access /transaction via link
          if (isAuthenticated &&
              (state.matchedLocation == TransactionScreen.route)) {
            // If link not is valid
            // redirect to /
            if (!LinkUtil.validateLink(state.uri.toString())) {
              sl<Logger>().d('invalid link ${state.uri.queryParameters}');
              return HomeScreen.route;
            } else {
              return null;
            }
          }
          return null;
        },
      );
}

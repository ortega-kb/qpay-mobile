import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/features/buy_credit/buy_credit_screen.dart';
import 'package:qpay/features/change_my_passwd/change_my_passwd_screen.dart';
import 'package:qpay/features/change_my_pin/change_my_pin_screen.dart';
import 'package:qpay/features/deposit/deposit_screen.dart';
import 'package:qpay/features/generate_invoice/generate_invoice_screen.dart';
import 'package:qpay/features/generate_invoice/pretty_qr_example.dart';
import 'package:qpay/features/language/language_screen.dart';
import 'package:qpay/features/login/login_screen.dart';
import 'package:qpay/features/main/main_screen.dart';
import 'package:qpay/features/my_beneficiary/my_beneficiary_screen.dart';
import 'package:qpay/features/my_qr_code/my_qr_code_screen.dart';
import 'package:qpay/features/register/register_screen.dart';
import 'package:qpay/features/scanner/scanner_screen.dart';
import 'package:qpay/features/themes/themes_screen.dart';
import 'package:qpay/features/transations/details_transaction_screen.dart';
import 'package:qpay/features/transations/transactions_screen.dart';
import 'package:qpay/features/transfer_money/transfer_money_screen.dart';
import 'package:qpay/features/welcome/welcome_screen.dart';
import 'package:qpay/routing/app_routes.dart';

import '../features/withdraw/withdraw_screen.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.register,
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
      ),
      GoRoute(
        path: AppRoutes.scanner,
        builder: (BuildContext context, GoRouterState state) {
          return ScannerScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.transactions,
        builder: (BuildContext context, GoRouterState state) {
          return TransactionsScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.detailsTransactions,
        builder: (BuildContext context, GoRouterState state) {
          return DetailsTransactionScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.generateInvoice,
        builder: (BuildContext context, GoRouterState state) {
          return PrettyQrHomePage();
        },
      ),
      GoRoute(
          path: AppRoutes.deposit,
          builder: (BuildContext context, GoRouterState state) {
            return DepositScreen();
          }),
      GoRoute(
        path: AppRoutes.withdraw,
        builder: (BuildContext context, GoRouterState state) {
          return WithdrawScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.transferMoney,
        builder: (BuildContext context, GoRouterState state) {
          return TransferMoneyScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.buyCredit,
        builder: (BuildContext context, GoRouterState state) {
          return BuyCreditScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.myQrCode,
        builder: (BuildContext context, GoRouterState state) {
          return MyQrCodeScreen(
            accountNumber: (state.extra as Map)["account_number"],
          );
        },
      ),
      GoRoute(
        path: AppRoutes.myBeneficiary,
        builder: (BuildContext context, GoRouterState state) {
          return MyBeneficiaryScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.themes,
        builder: (BuildContext context, GoRouterState) {
          return ThemesScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.changeMyPin,
        builder: (BuildContext context, GoRouterState state) {
          return ChangeMyPinScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.changeMyPasswd,
        builder: (BuildContext context, GoRouterState state) {
          return ChangeMyPasswdScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (BuildContext context, GoRouterState state) {
          return RegisterScreen();
        },
      )
    ],
  );
}

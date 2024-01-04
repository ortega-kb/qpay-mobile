import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/features/generate_invoice/generate_invoice_screen.dart';
import 'package:qpay/features/language/language_screen.dart';
import 'package:qpay/features/main/main_screen.dart';
import 'package:qpay/features/scanner/scanner_screen.dart';
import 'package:qpay/features/transations/details_transaction.dart';
import 'package:qpay/features/transations/transactions_screen.dart';
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
          return DetailsTransaction();
        },
      ),
      GoRoute(
        path: AppRoutes.generateInvoice,
        builder: (BuildContext context, GoRouterState state) {
          return GenerateInvoiceScreen();
        },
      )
    ],
  );
}

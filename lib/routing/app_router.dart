import 'package:flutter/material.dart';
import 'package:qpay/features/buy_credit/buy_credit_screen.dart';
import 'package:qpay/features/change_my_passwd/change_my_passwd_screen.dart';
import 'package:qpay/features/change_my_pin/change_my_pin_screen.dart';
import 'package:qpay/features/deposit/deposit_list_screen.dart';
import 'package:qpay/features/deposit/deposit_screen.dart';
import 'package:qpay/features/forgot_password/forgot_password_screen.dart';
import 'package:qpay/features/language/language_screen.dart';
import 'package:qpay/features/login/login_screen.dart';
import 'package:qpay/features/main/main_screen.dart';
import 'package:qpay/features/my_beneficiary/my_beneficiary_screen.dart';
import 'package:qpay/features/my_qr_code/my_qr_code_screen.dart';
import 'package:qpay/features/register/register_screen.dart';
import 'package:qpay/features/register_marchand/register_marchand_screen.dart';
import 'package:qpay/features/scanner/scanner_screen.dart';
import 'package:qpay/features/themes/themes_screen.dart';
import 'package:qpay/features/transations/details_transaction_screen.dart';
import 'package:qpay/features/transations/transactions_screen.dart';
import 'package:qpay/features/transfer_money/transfer_money_screen.dart';
import 'package:qpay/features/verify_account_screen/verify_account_screen.dart';
import 'package:qpay/features/welcome/welcome_screen.dart';
import 'package:qpay/features/withdraw/withdraw_list_screen.dart';
import 'package:qpay/features/withdraw/withdraw_screen.dart';
import 'package:qpay/routing/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.language:
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case AppRoutes.verifyAccount:
        return MaterialPageRoute(builder: (_) => VerifyAccountScreen());
      case AppRoutes.transferMoney:
        return MaterialPageRoute(builder: (_) => TransferMoneyScreen());
      case AppRoutes.myQrCode:
        return MaterialPageRoute(builder: (_) => MyQrCodeScreen());
      case AppRoutes.myBeneficiary:
        return MaterialPageRoute(builder: (_) => MyBeneficiaryScreen());
      case AppRoutes.themes:
        return MaterialPageRoute(builder: (_) => ThemesScreen());
      case AppRoutes.changeMyPasswd:
        return MaterialPageRoute(builder: (_) => ChangeMyPasswdScreen());
      case AppRoutes.changeMyPin:
        return MaterialPageRoute(builder: (_) => ChangeMyPinScreen());
      case AppRoutes.buyCredit:
        return MaterialPageRoute(builder: (_) => BuyCreditScreen());
      case AppRoutes.deposit:
        return MaterialPageRoute(builder: (_) => DepositScreen());
      case AppRoutes.depositList:
        return MaterialPageRoute(builder: (_) => DepositListScreen());
      case AppRoutes.withdrawList:
        return MaterialPageRoute(builder: (_) => WithdrawListScreen());
      case AppRoutes.detailsTransactions:
        return MaterialPageRoute(builder: (_) => DetailsTransactionScreen());
      case AppRoutes.scanner:
        return MaterialPageRoute(builder: (_) => ScannerScreen());
      case AppRoutes.transactions:
        return MaterialPageRoute(builder: (_) => TransactionsScreen());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case AppRoutes.withdraw:
        return MaterialPageRoute(builder: (_) => WithdrawScreen());
      case AppRoutes.registerMarchand:
        return MaterialPageRoute(builder: (_) => RegisterMarchandScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text("No page found !"),
          ),
        );
    }
  }
}

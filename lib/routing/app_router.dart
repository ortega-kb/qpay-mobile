import 'package:flutter/cupertino.dart';
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
  static routes() => {
    AppRoutes.language: (BuildContext context) => LanguageScreen(),
    AppRoutes.welcome: (BuildContext context) => WelcomeScreen(),
    AppRoutes.login: (BuildContext context) => LoginScreen(),
    AppRoutes.register: (BuildContext context) => RegisterScreen(),
    AppRoutes.forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    AppRoutes.verifyAccount: (BuildContext context) => VerifyAccountScreen(),
    AppRoutes.transferMoney: (BuildContext context) => TransferMoneyScreen(),
    AppRoutes.myQrCode: (BuildContext context) => MyQrCodeScreen(),
    AppRoutes.myBeneficiary: (BuildContext context) => MyBeneficiaryScreen(),
    AppRoutes.themes: (BuildContext context) => ThemesScreen(),
    AppRoutes.changeMyPasswd: (BuildContext context) => ChangeMyPasswdScreen(),
    AppRoutes.changeMyPin: (BuildContext context) => ChangeMyPinScreen(),
    AppRoutes.buyCredit: (BuildContext context) => BuyCreditScreen(),
    AppRoutes.deposit: (BuildContext context) => DepositScreen(),
    AppRoutes.depositList: (BuildContext context) => DepositListScreen(),
    AppRoutes.withdrawList: (BuildContext context) => WithdrawListScreen(),
    AppRoutes.detailsTransactions: (BuildContext context) => DetailsTransactionScreen(),
    AppRoutes.scanner: (BuildContext context) => ScannerScreen(),
    AppRoutes.transactions: (BuildContext context) => TransactionsScreen(),
    AppRoutes.main: (BuildContext context) => MainScreen(),
    AppRoutes.withdraw: (BuildContext context) => WithdrawScreen()
  };
}

import 'package:animate_icons/animate_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/features/account/presentation/screens/account_screen.dart';
import 'package:qpay/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:qpay/features/dashboard/presentation/screens/reports_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_code_dynamic_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_code_static_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late AnimateIconController animateIconController;

  @override
  void initState() {
    super.initState();
    animateIconController = AnimateIconController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screens = [
      DashboardScreen(),
      WalletListScreen(),
      ReportsScreen(),
      QrCodeStaticScreen(),
      AccountScreen()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.home_24_regular,
              size: 24,
            ),
            activeIcon: Icon(
              FluentIcons.home_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.wallet_credit_card_24_regular,
              size: 24,
            ),
            activeIcon: Icon(
              FluentIcons.wallet_credit_card_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.my_wallets,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.chart_multiple_24_regular,
              size: 24,
            ),
            activeIcon: Icon(
              FluentIcons.chart_multiple_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.reports,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.qr_code_24_regular,
              size: 24,
            ),
            activeIcon: Icon(
              FluentIcons.qr_code_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.my_qr_codes,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.person_24_regular,
              size: 24,
            ),
            activeIcon: Icon(
              FluentIcons.person_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.account_user,
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}

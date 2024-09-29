
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:qpay/features/dashboard/presentation/screens/reports_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_code_static_screen.dart';
import 'package:qpay/features/settings/presentation/screens/settings_screen.dart';
import 'package:qpay/features/wallet/presentation/screens/wallet_list_screen.dart';

import '../core/shared/cubits/home_navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static get path => '/';
  static get route => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<HomeNavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: state,
            onTap: (value) => context
                .read<HomeNavigationCubit>()
                .navigate(value),
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
                  FluentIcons.settings_24_regular,
                  size: 24,
                ),
                activeIcon: Icon(
                  FluentIcons.settings_24_filled,
                  size: 24,
                ),
                label: AppLocalizations.of(context)!.settings,
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<HomeNavigationCubit, int>(
        builder: (context, state) => [
          DashboardScreen(),
          WalletListScreen(),
          ReportsScreen(),
          QrCodeStaticScreen(),
          SettingsScreen()
        ][state]
      ),
    );
  }
}

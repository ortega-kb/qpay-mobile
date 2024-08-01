import 'package:animate_icons/animate_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/features/account/presentation/screens/account_screen.dart';
import 'package:qpay/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_code_dynamic_screen.dart';
import 'package:qpay/features/qr_code/presentation/screens/qr_code_static_screen.dart';

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
      QrCodeDynamicScreen(),
      QrCodeStaticScreen(),
      AccountScreen()
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.5,
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        useRotationAnimation: true,
        icon: Icons.add,
        activeIcon: Icons.close,
        buttonSize: Size(50.0, 50.0),
        children: [
          SpeedDialChild(
            backgroundColor: Colors.brown,
            onTap: () => context.go('/link-generator'),
            child: Icon(
              FluentIcons.building_bank_link_48_filled,
              color: AppColor.surface,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.payment_link,
          ),
          SpeedDialChild(
            backgroundColor: Colors.redAccent,
            onTap: () => context.go('/add-transaction'),
            child: Icon(
              FluentIcons.arrow_up_right_48_filled,
              size: 24,
              color: AppColor.surface,
            ),
            label: AppLocalizations.of(context)!.transfer_money,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.home_48_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.receipt_32_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.inventory,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.qr_code_24_regular,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.my_qr_codes,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.person_24_filled,
              size: 24,
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}

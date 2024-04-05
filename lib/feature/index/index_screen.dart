import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/feature/home/home_screen.dart';
import 'package:qpay/feature/inventory/inventory_screen.dart';
import 'package:qpay/feature/my_qr_code/qr_static_screen.dart';
import 'package:qpay/feature/profile/profile_screen.dart';
import 'package:qpay/feature/transfer_money/transfer_money_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;
  late AnimateIconController animateIconController;

  @override
  void initState() {
    animateIconController = AnimateIconController();
    super.initState();
  }

  final _screens = [
    HomeScreen(),
    InventoryScreen(),
    QRStaticScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: surface, // Status bar color
      ),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.5,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        useRotationAnimation: true,
        icon: Icons.add,
        activeIcon: Icons.close,
        buttonSize: Size(50.0, 50.0),
        children: [
          SpeedDialChild(
            backgroundColor: Colors.brown,
            onTap: () {},
            child: Icon(
              FontAwesomeIcons.moneyBills,
              color: surface,
              size: 20,
            ),
            label: AppLocalizations.of(context)!.payment_link,
          ),
          SpeedDialChild(
            backgroundColor: Colors.redAccent,
            onTap: () {
              Navigator.push(context, animateRoute(TransferMoneyScreen()));
            },
            child: Icon(
              CupertinoIcons.arrow_up_right,
              color: surface,
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
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory_outlined,
              size: 20,
            ),
            label: AppLocalizations.of(context)!.inventory,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.qrcode,
              size: 20,
            ),
            label: AppLocalizations.of(context)!.my_qr_codes,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}

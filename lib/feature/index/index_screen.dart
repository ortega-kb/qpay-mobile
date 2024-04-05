import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/feature/home/home_screen.dart';
import 'package:qpay/feature/inventory/inventory_screen.dart';
import 'package:qpay/feature/my_qr_code/qr_static_screen.dart';
import 'package:qpay/feature/profile/profile_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;

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
        backgroundColor: primary,
        foregroundColor: Colors.white,
        useRotationAnimation: true,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            onTap: () {},
            child: Icon(FontAwesomeIcons.person),
            label: "Add teacher",
          ),
          SpeedDialChild(
            onTap: () {},
            child: Icon(FontAwesomeIcons.bookBookmark),
            label: "Add course",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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

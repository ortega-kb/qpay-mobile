import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/feature/home/home_screen.dart';
import 'package:qpay/feature/inventory/inventory_screen.dart';
import 'package:qpay/feature/profile/profile_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;

  final _screens = [HomeScreen(), InventoryScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: surface, // Status bar color
      ),
    );

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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

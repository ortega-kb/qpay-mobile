import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/facture/facture_screen.dart';
import 'package:qpay/features/home/home_screen.dart';
import 'package:qpay/features/main/widgets/main_navigation_bar.dart';
import 'package:qpay/features/profile/profile_screen.dart';
import 'package:qpay/provider/main_navigation_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainNavigationProvider>(
        builder: (context, provider, child) {
          return [HomeScreen(), FactureScreen(), ProfileScreen()][provider.selectedPage];
        },
      ),
      bottomNavigationBar: Consumer<MainNavigationProvider>(
        builder: (context, provider, child) {
          return MainNavigationBar(
            currentIndex: provider.selectedPage,
            onTap: (index) {
              if (index != provider.selectedPage)
                provider.setPage(index);
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/home_screen.dart';
import 'package:qpay/features/main/widgets/main_navigation_bar.dart';
import 'package:qpay/provider/main_navigation_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainNavigationProvider>(
        builder: (context, provider, child) {
          return [HomeScreen()][provider.selectedPage];
        },
      ),
      bottomNavigationBar: Consumer<MainNavigationProvider>(
        builder: (context, provider, child) {
          return MainNavigationBar(
            currentIndex: provider.selectedPage,
            onTap: (index) {
              provider.setPage(index);
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/home_screen.dart';
import 'package:qpay/features/main/main_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Consumer<MainViewModel>(
        builder: (context, viewModel, child) {
          return [
            HomeScreen()
          ][viewModel.selectedPage];
        },
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/profile.dart';
import 'package:qpay/features/home/widgets/greeting.dart';
import 'package:qpay/features/home/widgets/sold.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Profile(size: 40),
            const SizedBox(width: medium),
            Greeting(name: "Ortega")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.qrcode_viewfinder),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: medium),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: medium),
                  child: Sold(soldCDF: "150000", soldUSD: "45")
              ),
              const SizedBox(height: large),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../spacing.dart';
import 'balance_indicator.dart';

class BalancePage extends StatelessWidget {
  final String balanceCDF;
  final String balanceUSD;

  const BalancePage({
    super.key,
    required this.balanceCDF,
    required this.balanceUSD,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView(
            controller: pageController,
            children: [
              // Balance(
              //   balance: balanceCDF,
              //   currency: Currency.CDF,
              // ),
              // Balance(
              //   balance: balanceUSD,
              //   currency: Currency.USD,
              // ),
            ],
            onPageChanged: (page) {},
          ),
        ),
        const SizedBox(height: extraSmall),
        BalanceIndicator(page: 0)
      ],
    );
  }
}

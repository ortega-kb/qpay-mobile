import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/widgets/balance.dart';
import 'package:qpay/features/home/widgets/balance_indicator.dart';
import 'package:qpay/provider/balance_page_provider.dart';
import 'package:qpay/utils/enums/currency.dart';
import 'package:qpay/utils/spacing.dart';

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
    final initialPage = Provider.of<BalancePageProvider>(context).selectedPage;

    final pageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.9,
    );

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Consumer<BalancePageProvider>(
            builder: (context, provider, child) {
              return PageView(
                controller: pageController,
                children: [
                  Balance(
                    balance: balanceCDF,
                    currency: Currency.CDF,
                  ),
                  Balance(
                    balance: balanceUSD,
                    currency: Currency.USD,
                  ),
                ],
                onPageChanged: (page) {
                  provider.setPage(page);
                },
              );
            },
          ),
        ),
        const SizedBox(height: extraSmall),
        Consumer<BalancePageProvider>(
          builder: (context, provider, child) {
            return BalanceIndicator(page: provider.selectedPage);
          },
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/widgets/balance_indicator.dart';
import 'package:qpay/provider/sold_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class Balance extends StatelessWidget {
  final String soldCDF;
  final String soldUSD;

  const Balance({super.key, required this.soldCDF, required this.soldUSD});

  @override
  Widget build(BuildContext context) {
    List currency = ["CDF", "USD"];

    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(middleSmall),
      ),
      child: Padding(
        padding: const EdgeInsets.all(medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      children: [
                        LocaleText(
                          "balance",
                          style: TextStyle(color: surface),
                        ),
                        Text(
                          currency[provider.selectedPage],
                          style: TextStyle(color: surface),
                        )
                      ],
                    );
                  },
                ),
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: () => provider.showSold(!provider.show),
                      borderRadius: BorderRadius.circular(medium),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(medium),
                          border: Border.all(color: surface),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: medium,
                            vertical: extraSmall,
                          ),
                          child: LocaleText(
                            provider.show ? "hide" : "show",
                            style: TextStyle(
                              color: surface,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: large),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return IconButton(
                      onPressed: () {
                        if (provider.selectedPage > 0) {
                          provider.setPage(0);
                        }
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: surface,
                      ),
                    );
                  },
                ),
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      provider.selectedPage == 0 ? soldCDF : soldUSD,
                      style: TextStyle(
                        color: surface,
                        fontSize:
                            Theme.of(context).textTheme.headlineLarge?.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return IconButton(
                      onPressed: () => provider.setPage(1),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: surface,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: large),
            Consumer<SoldProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(small),
                  child: BalanceIndicator(page: provider.selectedPage),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/widgets/sold_indicator.dart';
import 'package:qpay/provider/sold_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';


class Sold extends StatelessWidget {
  final String soldCDF;
  final String soldUSD;

  const Sold({super.key, required this.soldCDF, required this.soldUSD});

  @override
  Widget build(BuildContext context) {
    List currency = ["CDF", "USD"];

    return Container(
      decoration: BoxDecoration(
        color: orange,
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
                          "sold_in",
                          style: TextStyle(color: white),
                        ),
                        Text(
                          currency[provider.selectedPage],
                          style: TextStyle(color: white),
                        )
                      ],
                    );
                  },
                ),
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return LocaleText(
                      provider.show ? "hide" : "show",
                      style: TextStyle(
                        color: white,
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
                      onPressed: () => provider.setPage(0),
                      icon: Icon(
                        CupertinoIcons.back,
                        color: white,
                      ),
                    );
                  },
                ),
                Consumer<SoldProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      provider.selectedPage == 0 ? soldCDF : soldUSD,
                      style: TextStyle(
                        color: white,
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
                        color: white,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: large),
            Consumer<SoldProvider>(
              builder: (context, provider, child) {
                return SoldIndicator(page: provider.selectedPage);
              },
            )
          ],
        ),
      ),
    );
  }
}

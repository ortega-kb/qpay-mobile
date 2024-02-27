import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/balance_page_provider.dart';
import '../../../utils/enums/currency.dart';
import '../../color.dart';
import '../../spacing.dart';

class Balance extends StatelessWidget {
  final String balance;
  final Currency currency;

  const Balance({
    super.key,
    required this.balance,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(small),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(middleSmall),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: medium, left: medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "BALANCE",
                  style: TextStyle(
                    color: surface,
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer<BalancePageProvider>(
                  builder: (context, provider, child) {
                    return InkWell(
                      onTap: () => provider.onClickShow(!provider.showBalance),
                      borderRadius: BorderRadius.circular(medium),
                      child: Padding(
                        padding: const EdgeInsets.all(medium),
                        child: provider.showBalance
                            ? Text(
                                "hide",
                                style: TextStyle(
                                  color: surface,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "show",
                                style: TextStyle(
                                  color: surface,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currency.name,
                  style: TextStyle(
                    color: surface,
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: middleSmall),
                Expanded(
                  child: Text(
                    balance,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: surface,
                      height: 1,
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

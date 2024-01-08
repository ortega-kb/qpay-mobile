import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/enums/currency.dart';
import 'package:qpay/utils/spacing.dart';

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
        padding: const EdgeInsets.all(medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BALANCE",
              style: TextStyle(
                color: surface,
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                fontWeight: FontWeight.bold,
              ),
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

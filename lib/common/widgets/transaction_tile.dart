import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class TransactionTile extends StatelessWidget {
  final String action;
  final String date;
  final String amount;
  final String currency;
  final void Function()? onTap;

  const TransactionTile(
      {super.key,
      required this.action,
      required this.date,
      required this.amount,
      required this.currency,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Container(
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(middleSmall)
        ),
        child: ListTile(
          onTap: onTap,
          dense: true,
          title: Text(
            action,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: black,
              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            date,
            style: TextStyle(
                color: gray,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
          ),
          trailing: Text(
            amount + " ${currency}",
            style: TextStyle(
              color: black,
              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

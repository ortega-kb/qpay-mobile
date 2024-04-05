import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

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
      padding: const EdgeInsets.only(top: 0, bottom: small),
      child: Container(
        decoration: BoxDecoration(
            color: surface, borderRadius: BorderRadius.circular(middleSmall)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(middleSmall),
          child: ListTile(
            leading: Container(
              decoration:
                  BoxDecoration(color: background, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(extraSmall),
                child: Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 20,
                ),
              ),
            ),
            dense: true,
            title: Text(
              action,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              date,
              style: TextStyle(
                color: gray,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
            ),
            trailing: Text(
              amount + " ${currency}",
              style: TextStyle(
                color: black,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

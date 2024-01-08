import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';

import '../../../utils/spacing.dart';

class Item extends StatelessWidget {
  final String name;
  final double price;
  final int qte;

  const Item({
    super.key,
    required this.name,
    required this.price,
    required this.qte,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: medium,
        vertical: middleSmall,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                ),
                Text(
                  "$price * $qte",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: gray
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "${price * qte}",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: black
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/features/home/home_view_model.dart';

import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class Sold extends StatelessWidget {
  final String soldCDF;
  final String soldUSD;

  const Sold({super.key, required this.soldCDF, required this.soldUSD});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.circular(middleSmall),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Solde en CDF",
              style: TextStyle(color: white),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                "Voir",
                style: TextStyle(color: white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  soldUSD,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

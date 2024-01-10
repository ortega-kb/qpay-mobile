import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

import '../../../providers/dropdown_currency_provider.dart';

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: medium,
        vertical: medium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: medium),
                Consumer<DropdownCurrencyProvider>(
                  builder: (context, provider, child) {
                    return DropdownButton(
                      dropdownColor: surface,
                      value: provider.selectedCurrency,
                      borderRadius: BorderRadius.circular(medium),
                      items: provider.currencies
                          .map(
                            (currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency.name),
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) {
                        provider.onChangeCurrency(newValue);
                      },
                    );
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Text(
              "4500500",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

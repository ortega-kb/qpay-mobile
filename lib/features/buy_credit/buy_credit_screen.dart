import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/balance_page.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/title_more.dart';
import 'package:qpay/provider/dropdown_currency_provider.dart';
import 'package:qpay/provider/dropdown_network_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/enums/currency.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/supporting_title.dart';
import '../../provider/balance_page_provider.dart';
import '../../utils/operations.dart';

class BuyCreditScreen extends StatelessWidget {
  const BuyCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController totalController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "credit"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(text: "buy_credit", onTap: () {}),
      ),
      body: ListView(
        children: [
          const SizedBox(height: large),
          TitleMore(title: "select_wallet"),
          const SizedBox(height: medium),
          BalancePage(balanceCDF: "5000.0", balanceUSD: "900.0"),
          const SizedBox(height: medium),
          ListTile(
            title: LocaleText(
              "type_of_network",
              style: TextStyle(
                color: gray,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              ),
            ),
            trailing: Consumer<DropdownNetworkProvider>(
              builder: (context, provider, child) {
                return DropdownButton(
                  dropdownColor: surface,
                  value: provider.selectedNetwork,
                  items: provider.networks
                      .map(
                        (network) => DropdownMenuItem(
                          value: network,
                          child: Text(network.name),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    provider.onChangeNetwork(newValue);
                  },
                  borderRadius: BorderRadius.circular(medium),
                );
              },
            ),
          ),
          const SizedBox(height: medium),
          Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MTextField(
                  controller: phoneNumberController,
                  label: "phone_number",
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: medium),
                Consumer<BalancePageProvider>(
                  builder: (context, provider, child) {
                    return MTextField(
                      controller: amountController,
                      label: "amount",
                      obscureText: false,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: Text(
                          provider.selectedPage == 0
                              ? Currency.CDF.name
                              : Currency.USD.name,
                          style: TextStyle(color: black),
                        ),
                      ),
                      onChanged: (value) {
                        if (value!.isEmpty)
                          totalController.text = "";
                        else {
                          totalController.text = Operations()
                              .transferAmount(double.parse(value), 10)
                              .toString();
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: extraSmall),
                Consumer<BalancePageProvider>(
                  builder: (context, provider, child) {
                    return provider.selectedPage == 0
                        ? SupportingTitle(title: "Min: 1000 CDF")
                        : SupportingTitle(title: "Min: 1 USD");
                  },
                ),
                const SizedBox(height: medium),
                MTextField(
                  controller: totalController,
                  label: "total_and_transfer",
                  obscureText: false,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

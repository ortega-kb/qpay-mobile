import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/m_title.dart';

import '../../common/widgets/balance_page.dart';
import '../../common/widgets/supporting_title.dart';
import '../../common/widgets/title_more.dart';
import '../../provider/balance_page_provider.dart';
import '../../utils/color.dart';
import '../../utils/enums/currency.dart';
import '../../utils/operations.dart';
import '../../utils/spacing.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController totalController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "deposit"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: "do_deposit",
          onTap: () {},
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: large),
          TitleMore(title: "select_wallet"),
          const SizedBox(height: medium),
          BalancePage(balanceCDF: "5000.0", balanceUSD: "900.0"),
          const SizedBox(height: medium),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                                .transferAmount(double.parse(value), 1)
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
            ),
          )
        ],
      ),
    );
  }
}

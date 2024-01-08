import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/home/widgets/balance_page.dart';
import 'package:qpay/features/transfer_money/widgets/transfer_amount.dart';
import 'package:qpay/provider/balance_page_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/enums/currency.dart';
import 'package:qpay/utils/operations.dart';
import 'package:qpay/utils/spacing.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController account = TextEditingController();
    TextEditingController amount = TextEditingController();
    TextEditingController total = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "transfer_money"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: "transfer",
          onTap: () {},
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          BalancePage(balanceCDF: "5000.00", balanceUSD: "9000.00"),
          const SizedBox(height: medium),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MTextField(
                    controller: account,
                    label: "beneficiary_account",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: medium),
                  Consumer<BalancePageProvider>(
                    builder: (context, provider, child) {
                      return MTextField(
                        controller: amount,
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
                          ),
                        ),
                        onChanged: (value) {
                          if (value!.isEmpty)
                            total.text = "";
                          else {
                            total.text = Operations()
                                .transferAmount(double.parse(value), 5)
                                .toString();
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: medium),
                  MTextField(
                    controller: total,
                    label: "total_and_transfer",
                    obscureText: false,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qpay/core/design/common/widgets/all_wallet.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/supporting_title.dart';
import '../../core/design/common/widgets/title_more.dart';
import '../../core/design/operations.dart';
import '../../core/design/spacing.dart';
import '../../core/utils/enums/currency.dart';
import '../../providers/balance_page_provider.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _accountController = TextEditingController();
    TextEditingController _amountController = TextEditingController();
    TextEditingController _totalController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transfer_money),
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
          const SizedBox(height: large),
          TitleMore(title: "select_wallet"),
          const SizedBox(height: medium),
          AllWallet(
              onTap: () {}, title: AppLocalizations.of(context)!.wallet_cap),
          const SizedBox(height: medium),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MTextField(
                    controller: _accountController,
                    label: "beneficiary_account",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: medium),
                  Consumer<BalancePageProvider>(
                    builder: (context, provider, child) {
                      return MTextField(
                        controller: _amountController,
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
                            _totalController.text = "";
                          else {
                            _totalController.text = Operations()
                                .transferAmount(double.parse(value), 5)
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
                    controller: _totalController,
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

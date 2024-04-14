import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/common/widgets/all_wallet.dart';
import 'package:qpay/core/provider/wallet_indicator_provider.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/supporting_title.dart';
import '../../core/design/common/widgets/title_more.dart';
import '../../core/design/operations.dart';
import '../../core/design/spacing.dart';
import '../../core/utils/enums/currency.dart';

class TransferMoneyScreen extends ConsumerStatefulWidget {
  final String? accountNumber;
  final String? amount;
  final String? currency;

  const TransferMoneyScreen({
    super.key,
    this.accountNumber,
    this.amount,
    this.currency,
  });

  @override
  ConsumerState createState() => _TransferMoneyScreenState();
}

class _TransferMoneyScreenState extends ConsumerState<TransferMoneyScreen> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _totalController = TextEditingController();

  @override
  void initState() {
    initFields();
    super.initState();
  }

  initFields() {
    if (widget.accountNumber != null) {
      _accountController.text = widget.accountNumber!;
    }

    if (widget.amount != null) {
      _amountController.text = widget.amount!;
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _amountController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transfer_money),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.confirm,
          onTap: () {},
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: large),
          TitleMore(title: AppLocalizations.of(context)!.select_wallet),
          const SizedBox(height: medium),
          AllWallet(
            onTap: () {},
            title: AppLocalizations.of(context)!.wallet_cap,
          ),
          const SizedBox(height: medium),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MTextField(
                    controller: _accountController,
                    label: AppLocalizations.of(context)!.beneficiary_account,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: medium),
                  MTextField(
                    controller: _amountController,
                    label: AppLocalizations.of(context)!.amount,
                    obscureText: false,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    suffixIcon: TextButton(
                      onPressed: () {},
                      child: Text(
                        ref.watch(walletIndicatorProvider) == 0
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
                  ),
                  const SizedBox(height: extraSmall),
                  ref.watch(walletIndicatorProvider) == 0
                      ? SupportingTitle(title: "Min: 1000 CDF")
                      : SupportingTitle(title: "Min: 1 USD"),
                  const SizedBox(height: medium),
                  MTextField(
                    controller: _totalController,
                    label: AppLocalizations.of(context)!.total_and_transfer,
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

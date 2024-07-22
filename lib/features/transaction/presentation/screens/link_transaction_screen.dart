import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_subtitle.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/shared/widgets/select_wallet.dart';
import 'package:qpay/core/shared/widgets/wallet_tile.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/currency.dart';
import 'package:qpay/core/utils/link_generator.dart';
import 'package:qpay/core/utils/validator.dart';
import 'package:share_plus/share_plus.dart';

class LinkTransactionScreen extends StatefulWidget {
  const LinkTransactionScreen({super.key});

  @override
  State<LinkTransactionScreen> createState() => _LinkTransactionScreenState();
}

class _LinkTransactionScreenState extends State<LinkTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _walletTypeController = TextEditingController();

  @override
  void initState() {
    _walletTypeController.text = Currency.CDF.name;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _walletTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.payment_link),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
          child: ListView(
            children: [
              const SizedBox(height: AppDimen.p16),
              MSubtitle(
                title: AppLocalizations.of(context)!
                    .enter_information_link_payment,
              ),
              const SizedBox(height: AppDimen.p16),
              MTextField(
                controller: _amountController,
                label: AppLocalizations.of(context)!.amount,
                obscureText: false,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return Validator.allValidator(value);
                },
              ),
              const SizedBox(height: AppDimen.p16),
              MTextField(
                controller: _descriptionController,
                label: AppLocalizations.of(context)!.description,
                obscureText: false,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validator.allValidator(value);
                },
              ),
              const SizedBox(height: AppDimen.p16),
              MTextField(
                controller: _walletTypeController,
                readOnly: true,
                label: AppLocalizations.of(context)!.wallet,
                obscureText: false,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validator.allValidator(value);
                },
                onTap: () {
                  selectWallet(
                    context: context,
                    widgets: [
                      WalletTile(
                        currency: Currency.CDF.name,
                        onTap: () {
                          setState(() {
                            _walletTypeController.text = Currency.CDF.name;
                          });
                          Navigator.pop(context);
                        },
                        isChecked: _walletTypeController.text == Currency.CDF.name,
                      ),
                      WalletTile(
                        currency: Currency.USD.name,
                        onTap: () {
                          setState(() {
                            _walletTypeController.text = Currency.USD.name;
                          });
                          Navigator.pop(context);
                        },
                        isChecked: _walletTypeController.text == Currency.USD.name,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppDimen.p32),
              MButton(
                text: AppLocalizations.of(context)!.generate_link,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    linkGenerator(
                      id: "qp-984417512145",
                      amount: _amountController.text.trim(),
                      description: _descriptionController.text.trim(),
                      wallet: _walletTypeController.text,
                    ).then((link) {
                      Share.shareUri(link);
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

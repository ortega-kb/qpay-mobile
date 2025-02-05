import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/qr_response.dart';

import '../../../../core/shared/cubits/wallet_page_cubit.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/shared/widgets/supporting_title.dart';
import '../../../../core/utils/currency.dart';
import '../../../../core/utils/operations.dart';

class AddTransactionScreen extends StatefulWidget {
  final TransactionResponse? transactionResponse;
  const AddTransactionScreen({super.key, required this.transactionResponse});

  static String path = 'add-transaction';
  static String route = '/add-transaction';

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _walletController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.transactionResponse != null) {
      _accountController.text = widget.transactionResponse!.code;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _accountController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transfer_money),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              WalletUSDCDF(),
              const SizedBox(height: AppDimen.p16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MTextField(
                      controller: _accountController,
                      label: AppLocalizations.of(context)!.beneficiary_account,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: AppDimen.p16),
                    Builder(
                      builder: (context) {
                        return MTextField(
                          controller: _amountController,
                          label: AppLocalizations.of(context)!.amount,
                          obscureText: false,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          suffixIcon: TextButton(
                            onPressed: () {},
                            child: Text(
                              context.watch<WalletPageCubit>().state == 0
                                  ? Currency.CDF.name
                                  : Currency.USD.name,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppDimen.p2),
                    Builder(builder: (context) {
                      final wallet = context.watch<WalletPageCubit>().state;

                      _walletController.text =
                          wallet == 0 ? Currency.CDF.name : Currency.USD.name;

                      return wallet == 0
                          ? SupportingTitle(title: "Min: 1000 CDF")
                          : SupportingTitle(title: "Min: 1 USD");
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimen.p16),
        child: MButton(
          text: AppLocalizations.of(context)!.transfer_money,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final uri = LinkUtil.linkGenerator(
                userCode: _accountController.text.trim(),
                amount: _amountController.text.trim(),
                description: '',
                wallet: _walletController.text.trim(),
              );

              context.push(uri.toString());
            }
          },
        ),
      ),
    );
  }
}

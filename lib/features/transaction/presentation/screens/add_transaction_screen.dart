import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_dimen.dart';

import '../../../../core/shared/cubits/wallet_page_cubit.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/shared/widgets/supporting_title.dart';
import '../../../../core/utils/currency.dart';
import '../../../../core/utils/operations.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _accountController = TextEditingController();
  final _amountController = TextEditingController();
  final _totalController = TextEditingController();

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
                    const SizedBox(height: AppDimen.p2),
                    Builder(builder: (context) {
                      return context.watch<WalletPageCubit>().state == 0
                          ? SupportingTitle(title: "Min: 1000 CDF")
                          : SupportingTitle(title: "Min: 1 USD");
                    }),
                    SizedBox(height: AppDimen.p16),
                    MTextField(
                      controller: _totalController,
                      label: AppLocalizations.of(context)!.total_and_transfer,
                      obscureText: false,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
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
          onPressed: () {},
        ),
      ),
    );
  }
}

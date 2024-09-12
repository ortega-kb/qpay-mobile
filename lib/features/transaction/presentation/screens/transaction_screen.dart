import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/qr_response.dart';

class TransactionScreen extends StatelessWidget {
  final TransactionResponse? transactionResponse;

  const TransactionScreen({
    super.key,
    required this.transactionResponse
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimen.p16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(AppDimen.p16),
              ),
              child: Column(
                children: [
                  if (transactionResponse != null)
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.check_and_confirm,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: null,
                    ),
                  const Separator(isLarge: true),
                  const SizedBox(height: AppDimen.p8),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.account_recipient,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(transactionResponse!.code),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.amount,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(transactionResponse!.amount!.toStringAsFixed(2)),
                    trailing: Text(transactionResponse!.wallet!),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimen.p16),
        child: MButton(
          text: AppLocalizations.of(context)!.confirm,
          onPressed: () {},
        ),
      ),
    );
  }
}

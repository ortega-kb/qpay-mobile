import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/feature/transaction/widgets/details.dart';

import '../../core/design/spacing.dart';

class DetailsTransactionScreen extends StatelessWidget {
  const DetailsTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.details_transaction,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Details(
            reference: "#QP474FFQADAE",
            amount: "145000 CDF",
            operation: "Dépot",
            date: "12/09/2023",
            beneficiaryAccount: "QP7845112021",
          )
        ],
      ),
    );
  }
}

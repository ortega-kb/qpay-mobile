import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/feature/transaction/widgets/chip_operation_list.dart';
import 'package:qpay/feature/transaction/widgets/transaction_list.dart';

import '../../core/design/spacing.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transactions),
        actions: [],
      ),
      body: Column(
        children: [
          const SizedBox(height: medium),
          ChipOperationList(),
          const SizedBox(height: medium),
          Expanded(
            child: ListView(
              children: [TransactionList()],
            ),
          )
        ],
      ),
    );
  }
}

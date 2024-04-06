import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/feature/transaction/widgets/transaction_list.dart';

import '../../core/design/spacing.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late int groupValue = 0;

  @override
  void initState() {
    groupValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transactions),
        actions: [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: medium),
          CupertinoSegmentedControl(
            groupValue: groupValue,
            children: {
              0: Text(AppLocalizations.of(context)!.all),
              1: Text(AppLocalizations.of(context)!.transfer),
              2: Text(AppLocalizations.of(context)!.payment),
            },
            onValueChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          const SizedBox(height: medium),
          Expanded(
            child: ListView(
              children: [
                TransactionList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

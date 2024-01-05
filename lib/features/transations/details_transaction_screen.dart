import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/features/transations/widgets/details.dart';
import 'package:qpay/utils/spacing.dart';

class DetailsTransactionScreen extends StatelessWidget {
  const DetailsTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "details_transaction"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Details(
            reference: "#QP474FFQADAE",
            amount: "145000 CDF",
            operation: "Dépot",
            date: "12, Septembre 2023",
            beneficiaryAccount: "QP7845112021",
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/transaction_tile.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "transactions"),
        actions: [],
      ),
      body: Column(
        children: [
          const SizedBox(height: medium),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: medium),
                Chip(
                  label: Text("Toutes"),
                  backgroundColor: primary,
                  side: BorderSide(color: primary),
                  labelStyle: TextStyle(color: surface),
                ),
                const SizedBox(width: small),
                Chip(
                  label: Text("Retraits"),
                ),
                const SizedBox(width: small),
                Chip(
                  label: Text("Payements"),
                ),
                const SizedBox(width: small),
                Chip(
                  label: Text("Dépots"),
                ),
                const SizedBox(width: small),
                Chip(
                  label: Text("Transferts"),
                ),
                const SizedBox(width: medium)
              ],
            ),
          ),
          const SizedBox(height: medium),
          Expanded(
            child: ListView(
              children: [
                TransactionTile(
                  action: "Transfert",
                  date: "12, Octobre 2024",
                  amount: "10",
                  currency: "USD",
                  onTap: () => context.push(AppRoutes.detailsTransactions),
                ),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Payement",
                    date: "20, Janvier 2024",
                    amount: "15000",
                    currency: "CDF"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Dépot",
                    date: "03, Septembre 2023",
                    amount: "3000",
                    currency: "CDF"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Payement",
                    date: "04, Avril 2023",
                    amount: "254000",
                    currency: "CDF"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Payement",
                    date: "09, Juin 2022",
                    amount: "50",
                    currency: "USD"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Dépot",
                    date: "13, Novembre 2021",
                    amount: "30",
                    currency: "USD"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Transfert",
                    date: "06, Septembre 2020",
                    amount: "10000",
                    currency: "CDF"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Transfert",
                    date: "06, Septembre 2020",
                    amount: "78000",
                    currency: "CDF"),
                const SizedBox(height: small),
                TransactionTile(
                    action: "Payement",
                    date: "05, Juin 2020",
                    amount: "100",
                    currency: "USD"),
                const SizedBox(height: large)
              ],
            ),
          )
        ],
      ),
    );
  }
}

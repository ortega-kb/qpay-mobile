import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/transaction_tile.dart';
import 'package:qpay/features/home/widgets/greeting.dart';
import 'package:qpay/features/home/widgets/quick_operations_tile.dart';
import 'package:qpay/common/widgets/title_more.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/balance_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Greeting(name: "Ortega"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.scanner),
            icon: Icon(CupertinoIcons.qrcode_viewfinder),
          )
        ],
      ),
      body: RefreshIndicator(
        color: primary,
        onRefresh: () async {},
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: medium),
            BalancePage(balanceCDF: "5000.0", balanceUSD: "500.0"),
            const SizedBox(height: large),
            TitleMore(title: "quick_operations"),
            const SizedBox(height: medium),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: medium),
                  QuickOperationsTile(
                    title: "transfer_money",
                    icon: CupertinoIcons.arrow_right_arrow_left,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.transferMoney,
                    ),
                  ),
                  const SizedBox(width: small),
                  QuickOperationsTile(
                    title: "credit",
                    icon: Icons.phone_callback,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.buyCredit,
                    ),
                  ),
                  const SizedBox(width: small),
                  QuickOperationsTile(
                    title: "do_deposit",
                    icon: CupertinoIcons.arrow_down_left,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.depositList,
                    ),
                  ),
                  const SizedBox(width: small),
                  QuickOperationsTile(
                    title: "do_withdraw",
                    icon: CupertinoIcons.arrow_up_right,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.withdrawList,
                    ),
                  ),
                  const SizedBox(width: medium)
                ],
              ),
            ),
            const SizedBox(height: large),
            TitleMore(
              title: "transactions_history",
              onTap: () => Navigator.pushNamed(context, AppRoutes.transactions),
            ),
            const SizedBox(height: medium),
            TransactionTile(
                action: "Transfert",
                date: "12, Octobre 2024",
                amount: "10",
                currency: "USD"),
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
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/common/widgets/all_wallet.dart';
import 'package:qpay/core/design/common/widgets/freezed_toast_message.dart';
import 'package:qpay/core/design/common/widgets/title_action.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/feature/home/widgets/greeting.dart';
import 'package:qpay/feature/home/widgets/quick_operation_list.dart';
import 'package:qpay/feature/scanner/scanner_screen.dart';
import 'package:qpay/feature/transaction/transactions_screen.dart';
import 'package:qpay/feature/wallets/wallets_screen.dart';

import '../transaction/widgets/transaction_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Greeting(name: "Ortega"),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  animateRoute(
                    ScannerScreen(),
                  ),
                );
              },
              tooltip: AppLocalizations.of(context)!.scan_qr_code,
              icon: Icon(
                CupertinoIcons.qrcode_viewfinder,
              ),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: medium,
                left: medium,
                right: medium,
              ),
              child: FreezedToastMessage(
                title: AppLocalizations.of(context)!.wallet,
                subtitle: AppLocalizations.of(context)!.text_wallet,
                onTap: () {
                  Navigator.push(
                    context,
                    animateRoute(
                      WalletsScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: medium),
            AllWallet(
              title: AppLocalizations.of(context)!.wallet_cap,
              onTap: () {
                Navigator.push(
                  context,
                  animateRoute(
                    WalletsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: small),
            TitleAction(
              title: AppLocalizations.of(context)!.quick_operation,
              onTap: null,
            ),
            const SizedBox(height: small),
            QuickOperationList(),
            const SizedBox(height: small),
            TitleAction(
              title: AppLocalizations.of(context)!.transactions,
              onTap: () {
                Navigator.push(
                  context,
                  animateRoute(
                    TransactionsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: small),
            TransactionList()
          ],
        ),
      ),
    );
  }
}

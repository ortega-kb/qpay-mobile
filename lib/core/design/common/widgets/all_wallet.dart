import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/utils/enums/currency.dart';

import 'balance_indicator.dart';

class AllWallet extends StatefulWidget {
  final String title;
  final Function()? onTap;

  const AllWallet({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<AllWallet> createState() => _AllWalletState();
}

class _AllWalletState extends State<AllWallet> {
  var pageController = PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView(
            controller: pageController,
            children: [
              Wallet(
                title: widget.title,
                onTap: widget.onTap,
                currency: Currency.CDF,
              ),
              Wallet(
                title: widget.title,
                onTap: widget.onTap,
                currency: Currency.USD,
              ),
            ],
            onPageChanged: (page) {},
          ),
        ),
        const SizedBox(height: small),
        BalanceIndicator(page: pageController.initialPage)
      ],
    );
  }
}

class Wallet extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Currency currency;

  const Wallet({
    super.key,
    this.onTap,
    required this.currency,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: medium),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(middleSmall),
          color: primary,
        ),
        child: Column(
          children: [
            ListTile(
              dense: true,
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: surface, fontWeight: FontWeight.w500),
              ),
              trailing: InkWell(
                radius: 15,
                splashColor: gray,
                onTap: onTap,
                child: Icon(
                  CupertinoIcons.add_circled,
                  color: surface,
                ),
              ),
            ),
            ListTile(dense: true),
            ListTile(
              dense: true,
              title: Text(
                AppLocalizations.of(context)!.total_balance,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: surface.withOpacity(0.7),
                    ),
              ),
              subtitle: Text(
                currency == Currency.CDF
                    ? AppLocalizations.of(context)!.cdf("5000.00")
                    : AppLocalizations.of(context)!.usd("50.00"),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: surface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: extraSmall)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/spacing.dart';

class AllWallet extends StatelessWidget {
  final Function()? onTap;

  const AllWallet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                AppLocalizations.of(context)!.wallet_cap,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: surface, fontWeight: FontWeight.w500),
              ),
              trailing: InkWell(
                radius: 10,
                onTap: () {},
                child: Icon(
                  CupertinoIcons.add_circled,
                  color: surface,
                ),
              ),
            ),
            ListTile(dense: true),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.total_balance,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: surface.withOpacity(0.7),
                    ),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.cdf("5000.00"),
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

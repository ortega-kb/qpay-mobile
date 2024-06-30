import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class WalletListScreen extends StatefulWidget {
  const WalletListScreen({super.key});

  @override
  State<WalletListScreen> createState() => _WalletListScreenState();
}

class _WalletListScreenState extends State<WalletListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_wallets),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppLocalizations.of(context)!.add_wallet,
            icon: Icon(
              FluentIcons.add_circle_24_filled,
              size: 24,
            ),
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
    );
  }
}

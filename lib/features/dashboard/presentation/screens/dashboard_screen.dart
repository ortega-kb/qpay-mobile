import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.push('/qr-scanner'),
            tooltip: AppLocalizations.of(context)!.qr_scanner,
            icon: Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 24,
            ),
          ),
          const SizedBox(
            width: AppDimen.p8,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppDimen.p16),
            WalletUSDCDF()
          ],
        ),
      ),
    );
  }
}

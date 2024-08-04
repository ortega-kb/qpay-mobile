import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_color.dart';
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.greeting,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColor.gray),
            ),
            Text(
              "Ortega",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.qr_scanner,
            onPressed: () => context.push('/qr-scanner'),
            icon: Icon(FluentIcons.scan_dash_24_filled),
          ),
          const SizedBox(
            width: AppDimen.p0,
          ),
          IconButton(
            tooltip: AppLocalizations.of(context)!.notifications,
            onPressed: () => context.push('/notifications'),
            icon: Badge.count(
              count: 3,
              child: Icon(FluentIcons.alert_24_filled),
            ),
          ),
          const SizedBox(
            width: AppDimen.p8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppDimen.p16),
            WalletUSDCDF(),
          ],
        ),
      ),
    );
  }
}

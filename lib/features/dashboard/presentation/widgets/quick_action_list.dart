import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/features/dashboard/presentation/widgets/quick_action.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/app_dimen.dart';

class QuickActionList extends StatelessWidget {
  final Function()? onGenerateLinkPayment;
  const QuickActionList({super.key, required this.onGenerateLinkPayment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.p8),
      child: Wrap(
        spacing: AppDimen.p8,
        runSpacing: AppDimen.p8,
        children: [
          QuickAction(
            iconData: FluentIcons.arrow_trending_24_filled,
            title: AppLocalizations.of(context)!.transfer_money,
            onTap: () => context.push('/add-transaction'),
          ),
          QuickAction(
            iconData: FluentIcons.building_bank_link_24_filled,
            title: AppLocalizations.of(context)!.payment_link,
            onTap: onGenerateLinkPayment,
          ),
        ],
      ),
    );
  }
}

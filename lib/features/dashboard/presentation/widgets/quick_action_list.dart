import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/features/dashboard/presentation/widgets/quick_action.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_dimen.dart';

class QuickActionList extends StatelessWidget {
  const QuickActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: AppDimen.p16),
          QuickAction(
            iconData: FluentIcons.arrow_trending_20_filled,
            title: AppLocalizations.of(context)!.transfer_money,
            onTap: () => context.push('/add-transaction'),
          ),
          const SizedBox(width: AppDimen.p8),
          QuickAction(
            iconData: FluentIcons.building_bank_link_24_filled,
            title: AppLocalizations.of(context)!.payment_link,
            onTap: () => context.push('/link-generator'),
          ),
          const SizedBox(width: AppDimen.p16),
        ],
      ),
    );
  }
}

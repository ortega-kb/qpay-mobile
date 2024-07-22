import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qpay/core/shared/widgets/wallet_tile.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/utils/currency.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/app_dimen.dart';

Future selectWallet(
    {required BuildContext context, required List<Widget> widgets}) {
  return WoltModalSheet.show(
    context: context,
    useSafeArea: true,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          scrollController: ScrollController(),
          topBarTitle: Text(
            AppLocalizations.of(context)!.wallet,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          isTopBarLayerAlwaysVisible: true,
          child: Padding(
            padding: EdgeInsets.all(AppDimen.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widgets,
                const SizedBox(height: AppDimen.p16)
              ],
            ),
          ),
        )
      ];
    },
  );
}

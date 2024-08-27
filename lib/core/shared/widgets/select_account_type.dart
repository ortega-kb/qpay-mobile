import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/app_dimen.dart';

Future selectAccountType(
    {required BuildContext context, required List<Widget> widgets}) {
  return WoltModalSheet.show(
    context: context,
    useSafeArea: true,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          scrollController: ScrollController(),
          topBarTitle: Text(
            AppLocalizations.of(context)!.account_type,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/design/color.dart';
import '../../../core/design/common/widgets/line.dart';
import '../../../core/design/common/widgets/row_details.dart';
import '../../../core/design/common/widgets/tile_container.dart';
import '../../../core/design/spacing.dart';

class Details extends StatelessWidget {
  final String reference;
  final String amount;
  final String operation;
  final String date;
  final String beneficiaryAccount;

  const Details(
      {super.key,
      required this.reference,
      required this.amount,
      required this.operation,
      required this.date,
      required this.beneficiaryAccount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: TileContainer(
        child: Column(
          children: [
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.reference,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                reference,
                style: TextStyle(color: gray),
              ),
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: reference,
                    ),
                  );
                },
                icon: Icon(
                  FontAwesomeIcons.solidCopy,
                  size: 20,
                  color: black,
                ),
              ),
            ),
            const Line(),
            RowDetails(
              title: AppLocalizations.of(context)!.amount,
              value: amount,
            ),
            RowDetails(
                title: AppLocalizations.of(context)!.operation,
                value: operation),
            RowDetails(
              title: AppLocalizations.of(context)!.date,
              value: date,
            ),
            const Line(),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.beneficiary_account,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                beneficiaryAccount,
                style: TextStyle(color: gray),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

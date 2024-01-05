import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/features/transations/widgets/row_details.dart';

import '../../../common/widgets/line.dart';
import '../../../common/widgets/tile_container.dart';
import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

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
              title: LocaleText("reference"),
              subtitle: Text(
                reference,
                style: TextStyle(color: gray),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.copy_rounded,
                  color: black,
                ),
              ),
            ),
            const Line(),

            RowDetails(title: "amount", value: amount),
            RowDetails(title: "operation", value: operation),
            RowDetails(title: "date", value: date),

            const Line(),
            ListTile(
              title: LocaleText("account_of_beneficiary"),
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

import 'package:flutter/cupertino.dart';

import '../../../core/design/animator_route.dart';
import '../../../core/design/common/widgets/transaction_tile.dart';
import '../../../core/design/spacing.dart';
import '../details_transaction_screen.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: TransactionTile(
              action: "Transfert",
              date: "0${i + 1}/09/2023",
              amount: "${i + 1}000",
              currency: "CDF",
              onTap: () {
                Navigator.push(
                  context,
                  animateRoute(
                    DetailsTransactionScreen(),
                  ),
                );
              },
            ),
          ),
        const SizedBox(
          height: medium,
        )
      ],
    );
  }
}

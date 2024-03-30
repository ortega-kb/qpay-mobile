import 'package:flutter/cupertino.dart';
import 'package:qpay/feature/transaction/widgets/chip_operation.dart';

import '../../../core/design/spacing.dart';

class ChipOperationList extends StatelessWidget {
  const ChipOperationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          const SizedBox(width: medium),
          ChipOperation(label: "Toutes", selected: true),
          const SizedBox(width: middleSmall),
          ChipOperation(label: "Transfert", selected: false),
          const SizedBox(width: middleSmall),
          ChipOperation(label: "Paiement", selected: false),
          const SizedBox(width: medium),
        ],
      ),
    );
  }
}

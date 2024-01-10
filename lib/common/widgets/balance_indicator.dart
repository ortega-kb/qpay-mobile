import 'package:flutter/material.dart';

import '../../../common/widgets/indicator.dart';
import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class BalanceIndicator extends StatelessWidget {
  final int page;

  const BalanceIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          active: page == 0,
          activeColor: primary,
          inactiveColor: gray,
        ),
        const SizedBox(width: extraSmall),
        Indicator(
          active: page == 1,
          activeColor: primary,
          inactiveColor: gray,
        )
      ],
    );
  }
}

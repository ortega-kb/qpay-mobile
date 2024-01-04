import 'package:flutter/material.dart';

import '../../../common/widgets/indicator.dart';
import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class SoldIndicator extends StatelessWidget {
  final int page;
  const SoldIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(active: page == 0, activeColor: surface, inactiveColor: surface),
        const SizedBox(width: small),
        Indicator(active: page == 1, activeColor: surface, inactiveColor: surface)
      ],
    );
  }
}

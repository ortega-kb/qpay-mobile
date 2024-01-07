import 'package:flutter/material.dart';

import '../../../common/widgets/indicator.dart';
import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class RegisterIndicator extends StatelessWidget {
  final int page;
  const RegisterIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(active: page == 0, activeColor: primary, inactiveColor: gray),
        const SizedBox(width: small),
        Indicator(active: page == 1, activeColor: primary, inactiveColor: gray),
        const SizedBox(width: small),
        Indicator(active: page == 2, activeColor: primary, inactiveColor: gray),
        const SizedBox(width: small),
        Indicator(active: page == 3, activeColor: primary, inactiveColor: gray),
      ],
    );
  }
}

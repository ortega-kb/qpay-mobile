import 'package:flutter/cupertino.dart';
import 'package:qpay/common/widgets/indicator.dart';
import 'package:qpay/utils/color.dart';

import '../../../utils/spacing.dart';

class PageIndicator extends StatelessWidget {
  final int page;

  const PageIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(active: page == 0, activeColor: orange, inactiveColor: gray),
        const SizedBox(width: small),
        Indicator(active: page == 1, activeColor: orange, inactiveColor: gray),
        const SizedBox(width: small),
        Indicator(active: page == 2, activeColor: orange, inactiveColor: gray),
      ],
    );
  }
}

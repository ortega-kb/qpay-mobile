import 'package:flutter/cupertino.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/widget/welcome/indicator.dart';

import '../../utils/spacing.dart';

class PageIndicator extends StatelessWidget {
  final int page;

  const PageIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(active: page == 0),
        const SizedBox(width: small),
        Indicator(active: page == 1),
        const SizedBox(width: small),
        Indicator(active: page == 2),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../core/design/color.dart';
import '../../../../core/design/common/widgets/indicator.dart';
import '../../../../core/design/spacing.dart';

class PageIndicator extends StatelessWidget {
  final int page;

  const PageIndicator({super.key, required this.page});

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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class Separator extends StatelessWidget {
  final bool isLarge;
  const Separator({
    super.key,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: !isLarge ? AppDimen.p16: AppDimen.p0),
      child: Container(
        height: .5,
        color: AppColor.greyColor.withOpacity(.5),
      ),
    );
  }
}

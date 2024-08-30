import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
      child: Container(
        height: .5,
        color: AppColor.greyColor.withOpacity(.5),
      ),
    );
  }
}

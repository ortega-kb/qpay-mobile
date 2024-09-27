import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';


class SupportingTitle extends StatelessWidget {
  final String title;

  const SupportingTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColor.greyColor,
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
    );
  }
}

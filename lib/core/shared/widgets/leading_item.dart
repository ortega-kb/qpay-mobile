import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class LeadingItem extends StatelessWidget {
  final IconData iconData;
  final Color color;

  const LeadingItem({
    super.key,
    required this.iconData,
    this.color = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimen.p4),
        child: Icon(
          iconData,
          size: 22,
        ),
      ),
    );
  }
}

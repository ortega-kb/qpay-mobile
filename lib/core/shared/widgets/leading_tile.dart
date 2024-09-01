import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class LeadingTile extends StatelessWidget {
  final IconData iconData;
  const LeadingTile({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimen.p4),
        child: Icon(
          iconData,
          size: 24,
        ),
      ),
    );
  }
}

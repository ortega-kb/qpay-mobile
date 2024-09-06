import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/leading_item.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_dimen.dart';

class QuickAction extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const QuickAction({
    super.key,
    required this.iconData,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimen.p32),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(AppDimen.p12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LeadingItem(iconData: iconData),
              const SizedBox(width: AppDimen.p8),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(AppDimen.p32),
        ),
      ),
    );
  }
}

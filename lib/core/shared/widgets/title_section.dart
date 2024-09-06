import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final Function()? onClickAction;
  final Color titleColor;
  final Color actionTitleColor;

  const TitleSection({
    super.key,
    required this.title,
    this.actionTitle,
    this.actionTitleColor = AppColor.primary,
    this.titleColor = AppColor.black,
    this.onClickAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
      ),
      trailing: actionTitle != null
          ? TextButton(
              onPressed: onClickAction,
              child: Text(
                actionTitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: actionTitleColor,
                    ),
              ),
            )
          : null,
    );
  }
}

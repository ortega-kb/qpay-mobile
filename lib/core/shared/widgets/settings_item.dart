import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/leading_item.dart';
import 'package:qpay/core/theme/app_color.dart';

class SettingsItem extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final String? subtitle;
  final bool hasNext;
  final Function()? onTap;

  const SettingsItem({
    super.key,
    this.hasNext = true,
    this.subtitle,
    required this.title,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: iconData != null ? LeadingItem(iconData: iconData!) : null,
        title: Text(title),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColor.gray),
              )
            : null,
        trailing: hasNext
            ? IconButton(
                onPressed: onTap,
                icon: Icon(Icons.keyboard_arrow_right),
              )
            : null);
  }
}

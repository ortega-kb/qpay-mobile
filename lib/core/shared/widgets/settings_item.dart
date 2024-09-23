import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/leading_item.dart';

class SettingsItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool hasNext;
  final Function()? onTap;

  const SettingsItem({
    super.key,
    this.hasNext = true,
    required this.title,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: LeadingItem(iconData: iconData),
        title: Text(title),
        trailing: hasNext
            ? IconButton(
                onPressed: onTap,
                icon: Icon(Icons.keyboard_arrow_right),
              )
            : null);
  }
}

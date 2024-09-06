import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/leading_item.dart';
import 'package:qpay/core/theme/app_color.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: LeadingItem(
        iconData: FluentIcons.arrow_trending_24_filled,
        color: AppColor.red,
      ),
      title: Text('Transaction'),
      subtitle: Text('Last transaction'),
      trailing: Text('Rs. 1000'),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';

class QRStaticTile extends StatelessWidget {
  final QRStatic qrStatic;
  final int index;
  final Function() onTap;
  final Function() onDelete;

  const QRStaticTile({
    super.key,
    required this.index,
    required this.qrStatic,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Hero(
        tag: index,
        child: Container(
          decoration:
              BoxDecoration(color: AppColor.background, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(AppDimen.p2),
            child: Icon(
              FluentIcons.qr_code_28_filled,
              size: 24,
            ),
          ),
        ),
      ),
      title: Text(
        qrStatic.motif,
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        qrStatic.amount.toString() + " ${qrStatic.currency}",
        style: TextStyle(
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: Icon(
          FluentIcons.delete_24_filled,
          size: 19,
        ),
      ),
    );
  }
}

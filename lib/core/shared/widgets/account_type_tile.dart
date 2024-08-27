import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';

class AccountTypeTile extends StatefulWidget {
  final String accountType;
  final String? accountTypeDesc;
  final Function()? onTap;
  final bool isChecked;

  const AccountTypeTile({
    super.key,
    required this.accountType,
    this.accountTypeDesc,
    required this.onTap,
    this.isChecked = false,
  });

  @override
  State<AccountTypeTile> createState() => _AccountTypeTileState();
}

class _AccountTypeTileState extends State<AccountTypeTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Text(widget.accountType),
      subtitle: Text(widget.accountTypeDesc ?? '') ,
      trailing: widget.isChecked
          ? Icon(
              Icons.check_circle,
              color: AppColor.primary,
            )
          : null,
    );
  }
}

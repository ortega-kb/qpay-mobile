import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class WalletTile extends StatefulWidget {
  final String currency;
  final Function()? onTap;
  final bool isChecked;

  const WalletTile({
    super.key,
    required this.currency,
    required this.onTap,
    this.isChecked = false,
  });

  @override
  State<WalletTile> createState() => _WalletTileState();
}

class _WalletTileState extends State<WalletTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Text(widget.currency),
      trailing: widget.isChecked
          ? Icon(
              Icons.check_circle,
              color: AppColor.primary,
            )
          : null,
    );
  }
}

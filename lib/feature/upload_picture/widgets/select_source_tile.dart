import 'package:flutter/material.dart';
import 'package:qpay/core/design/color.dart';

class SelectSourceTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData icon;
  const SelectSourceTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/core/design/color.dart';

class SelectLanguageTile extends StatelessWidget {
  final String? image;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool active;
  final Function()? onTap;

  const SelectLanguageTile(
      {super.key,
      this.image,
      this.subtitle,
      this.icon,
      required this.title,
      required this.active,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image != null
          ? CircleAvatar(
              backgroundImage: AssetImage(
                image!,
              ),
            )
          : icon != null
              ? Icon(
                  icon,
                  size: 22,
                )
              : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
      splashColor: Colors.transparent,
      trailing: Checkbox(
        value: active,
        onChanged: (value) {},
        activeColor: primary,
      ),
    );
  }
}

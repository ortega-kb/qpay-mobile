import 'package:flutter/material.dart';
import 'package:qpay/core/design/color.dart';

class SelectLanguageTile extends StatelessWidget {
  final String image;
  final String title;
  final bool active;
  final Function()? onTap;

  const SelectLanguageTile(
      {super.key,
      required this.image,
      required this.title,
      required this.active,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(title),
      onTap: onTap,
      trailing: Checkbox(
        value: active,
        onChanged: (value) {},
        activeColor: primary,
      ),
    );
  }
}

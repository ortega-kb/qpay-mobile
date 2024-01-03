import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class ParamTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const ParamTile(
      {super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: whiteGray),
            borderRadius: BorderRadius.circular(middleSmall)),
        child: ListTile(
          onTap: onTap,
          dense: true,
          leading: Icon(icon, color: black),
          title: Text(
            title,
            style: TextStyle(
              fontSize: Theme
                  .of(context)
                  .textTheme
                  .titleSmall
                  ?.fontSize,
            ),
          ),
          trailing: Icon(CupertinoIcons.chevron_forward, size: 20),
        ),
      ),
    );
  }
}

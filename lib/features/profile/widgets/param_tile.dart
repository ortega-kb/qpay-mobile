import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class ParamTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const ParamTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(middleSmall)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(middleSmall),
          child: ListTile(
            dense: false,
            leading: Icon(icon, color: black),
            title: LocaleText(
              title
            ),
            trailing: Icon(CupertinoIcons.chevron_forward, size: 20),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../color.dart';

class LinkText extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const LinkText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final Color? color;

  const Subtitle({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: color ?? gray,
        ),
      ),
    );
  }
}

class SubtitleDyn extends StatelessWidget {
  final String text;

  const SubtitleDyn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: small),
      child: Text(
        text,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            color: gray),
      ),
    );
  }
}

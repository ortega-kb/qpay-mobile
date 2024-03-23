import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? padding;
  final FontWeight? fontWeight;

  const Subtitle(
      {super.key,
      required this.text,
      this.color,
      this.padding,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? medium),
      child: Text(
        text,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            color: color ?? gray,
            fontWeight: fontWeight),
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
          color: gray,
        ),
      ),
    );
  }
}

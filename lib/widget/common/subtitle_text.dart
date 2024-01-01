import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class SubtitleText extends StatelessWidget {
  final String text;

  const SubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: gray
        ),
      ),
    );
  }
}

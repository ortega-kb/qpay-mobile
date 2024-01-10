import 'package:flutter/material.dart';
import 'package:qpay/utils/color.dart';

class SupportingTitle extends StatelessWidget {
  final String title;

  const SupportingTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: gray,
        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
      ),
    );
  }
}

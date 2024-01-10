import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class Subtitle extends StatelessWidget {
  final String text;

  const Subtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: LocaleText(
        text,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: gray
        ),
      ),
    );
  }
}

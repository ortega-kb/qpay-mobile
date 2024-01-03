import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/utils/color.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const MyTextButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      isSemanticButton: false,
      child: LocaleText(
        text,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: orange
        ),
      ),
    );
  }
}

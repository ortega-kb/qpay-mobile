import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../utils/color.dart';
import '../../utils/spacing.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: orange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(large)),
      textColor: white,
      child: Padding(
        padding: const EdgeInsets.all(middleSmall),
        child: LocaleText(
          text,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
        ),
      ),
      onPressed: onPressed,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class MyTitle extends StatelessWidget {
  final String text;

  const MyTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LocaleText(
      text,
      style: TextStyle(
        fontSize: Theme
            .of(context)
            .textTheme
            .titleLarge
            ?.fontSize,
        fontWeight: FontWeight.bold,),
    );
  }
}

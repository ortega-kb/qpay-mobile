import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';

class Greeting extends StatelessWidget {
  final String name;

  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocaleText(
          "hello",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            color: gray,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

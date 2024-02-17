import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../color.dart';
import '../../spacing.dart';

class MOutlinedButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MOutlinedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 48),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(large),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            backgroundBlendMode: BlendMode.darken,
            borderRadius: BorderRadius.circular(large),
            border: Border.all(color: gray),
          ),
          child: Padding(
            padding: const EdgeInsets.all(middleSmall),
            child: LocaleText(
              text,
              style: TextStyle(
                  color: gray,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

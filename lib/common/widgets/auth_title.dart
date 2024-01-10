import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';


class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: LocaleText(
        title,
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize
        ),
      ),
    );
  }
}

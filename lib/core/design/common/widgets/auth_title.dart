import 'package:flutter/material.dart';

import '../../spacing.dart';

class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        ),
      ),
    );
  }
}

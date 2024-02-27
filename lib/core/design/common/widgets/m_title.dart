import 'package:flutter/material.dart';

class MTitle extends StatelessWidget {
  final String text;

  const MTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

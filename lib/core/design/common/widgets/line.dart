import 'package:flutter/material.dart';

import '../../color.dart';
import '../../spacing.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Container(
        height: 1,
        width: double.infinity,
        color: background,
      ),
    );
  }
}

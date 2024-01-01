import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class Indicator extends StatelessWidget {
  final bool active;
  final double size;

  const Indicator({super.key, required this.active, this.size = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? size * 2 : size,
      height: size,
      decoration: BoxDecoration(
          color: active ? orange : gray,
          borderRadius: BorderRadius.circular(size / 2)
      ),
    );
  }
}

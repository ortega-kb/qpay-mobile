import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/spacing.dart';

class TileContainer extends StatelessWidget {
  final Widget child;
  const TileContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(large)
      ),
      child: child,
    );
  }
}

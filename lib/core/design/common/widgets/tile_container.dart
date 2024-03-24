import 'package:flutter/material.dart';

import '../../spacing.dart';

class TileContainer extends StatelessWidget {
  final Widget child;
  const TileContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(middleSmall)),
      child: child,
    );
  }
}

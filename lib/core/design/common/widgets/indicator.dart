import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool active;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const Indicator(
      {super.key,
      required this.active,
      required this.activeColor,
      required this.inactiveColor,
      this.size = 8.5});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: active ? size * 2 : size,
      height: size,
      curve: Curves.easeInOutBack,
      decoration: BoxDecoration(
        color: active ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      duration: Duration(milliseconds: 500),
    );
  }
}

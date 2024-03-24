import 'package:flutter/material.dart';
import 'package:qpay/core/design/color.dart';

class ChipOperation extends StatelessWidget {
  final String label;
  final bool selected;

  const ChipOperation({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: selected ? surface : gray,
            ),
      ),
      backgroundColor: selected ? primary : surface,
      side: BorderSide(color: selected ? primary : surface),
    );
  }
}

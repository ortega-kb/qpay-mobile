import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/spacing.dart';

class SelectLanguage extends StatelessWidget {
  final String title;
  final bool active;
  final Function(bool?)? onChanged;

  const SelectLanguage(
      {super.key,
      required this.title,
      required this.active,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: medium),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: active ? orange : whiteGray),
          borderRadius: BorderRadius.circular(middleSmall)
        ),
        child: CheckboxListTile(
          activeColor: orange,
          title: Text(title),
          value: active,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

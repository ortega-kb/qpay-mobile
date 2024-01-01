import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class SelectLanguageTile extends StatelessWidget {
  final String title;
  final bool active;
  final Function(bool?)? onChanged;

  const SelectLanguageTile(
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
          title: LocaleText(title),
          value: active,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

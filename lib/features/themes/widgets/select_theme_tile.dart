import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';

class SelectThemeTile extends StatelessWidget {
  final String title;
  final bool active;
  final Function(bool?)? onChanged;

  const SelectThemeTile(
      {super.key,
        required this.title,
        required this.active,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: primary,
      title: LocaleText(title),
      value: active,
      onChanged: onChanged,
    );
  }
}

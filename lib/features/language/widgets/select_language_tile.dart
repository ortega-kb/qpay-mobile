import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../core/design/color.dart';

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
    return CheckboxListTile(
      activeColor: primary,
      title: LocaleText(title),
      value: active,
      onChanged: onChanged,
    );
  }
}

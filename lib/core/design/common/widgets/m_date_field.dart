import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../color.dart';

class MDateField extends StatelessWidget {
  final String label;
  final DateTime? dateTime;
  final Function(DateTime?)? onChanged;
  const MDateField(
      {super.key,
      required this.label,
      required this.dateTime,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: gray,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          ),
        ),
      ),
      value: dateTime,
      mode: DateTimeFieldPickerMode.date,
      dateFormat: DateFormat.yMd(AppLocalizations.of(context)!.localeName),
      onChanged: onChanged,
    );
  }
}

final dateStateProvider = StateProvider<DateTime?>((ref) {
  return null;
});

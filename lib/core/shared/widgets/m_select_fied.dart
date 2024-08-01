import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../utils/validator.dart';


class MSelectField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextEditingController selectEditingController;
  final List<Map<String, dynamic>>? items;

  const MSelectField(
      {super.key,
      required this.selectEditingController,
      required this.initialValue,
      required this.label,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return SelectFormField(
      type: SelectFormFieldType.dropdown,
      initialValue: initialValue,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      ),
      items: items,
      controller: selectEditingController,
      validator: (value) {
        return Validator.allValidator(value);
      },
    );
  }
}

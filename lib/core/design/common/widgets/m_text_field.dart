import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../color.dart';

class MTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;

  const MTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.obscureText,
      required this.keyboardType,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap,
      this.prefixIcon,
      this.validator,
      this.focusNode,
      this.errorMsg,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      maxLines: 1,
      cursorColor: primary,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      decoration: InputDecoration(
          isDense: false,
          suffixIcon: suffixIcon,
          prefix: prefixIcon,
          filled: false,
          labelText: Locales.string(context, label),
          errorText: errorMsg,
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary)),
          labelStyle: TextStyle(color: gray),
          border: UnderlineInputBorder(borderSide: BorderSide(color: gray))),
    );
  }
}

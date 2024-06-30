import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';

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
      cursorColor: AppColor.primary,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: false,
        suffixIcon: suffixIcon,
        prefix: prefixIcon,
        filled: false,
        labelText: label,
        errorText: errorMsg,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary,
          ),
        ),
        labelStyle: TextStyle(
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.gray),
        ),
      ),
    );
  }
}

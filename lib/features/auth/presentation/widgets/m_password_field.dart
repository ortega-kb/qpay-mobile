import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_color.dart';

class MPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;

  const MPasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
  });

  @override
  State<MPasswordField> createState() => _MPasswordFieldState();
}

class _MPasswordFieldState extends State<MPasswordField> {
  bool showPassword = false;

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: showPassword,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      maxLines: 1,
      inputFormatters: widget.inputFormatters,
      cursorColor: AppColor.primary,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isDense: false,
        suffixIcon: IconButton(
          onPressed: () {
            toggleShowPassword();
          },
          icon: Icon(
            showPassword
                ? FluentIcons.eye_24_filled
                : FluentIcons.eye_off_24_filled,
          ),
        ),
        prefix: widget.prefixIcon,
        filled: false,
        labelText: widget.label,
        errorText: widget.errorMsg,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primary,
          ),
        ),
        labelStyle: TextStyle(
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.gray),
        ),
      ),
    );
  }
}

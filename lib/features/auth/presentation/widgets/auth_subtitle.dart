import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';

class AuthSubtitle extends StatelessWidget {
  final String title;

  const AuthSubtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.p12),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.gray,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
      ),
    );
  }
}
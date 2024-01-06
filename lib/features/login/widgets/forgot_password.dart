import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../utils/color.dart';
import '../../../utils/spacing.dart';

class ForgotPassword extends StatelessWidget {
  final void Function()? onTap;
  const ForgotPassword({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(middleSmall),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: extraSmall,
              horizontal: small,
            ),
            child: LocaleText(
              "forgot_password",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                color: gray,
              ),
            ),
          ),
        )
      ],
    );
  }
}

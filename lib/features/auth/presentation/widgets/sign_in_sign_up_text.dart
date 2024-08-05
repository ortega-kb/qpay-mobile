import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';

class SignInSignUpText extends StatelessWidget {
  final String title;
  final String titleAction;
  final Function()? onTap;

  const SignInSignUpText({
    super.key,
    required this.title,
    required this.titleAction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.gray);
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: AppColor.primary);

    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(style: defaultStyle, children: [
      TextSpan(text: title),
      TextSpan(text: ' '),
      TextSpan(
        text: titleAction,
        style: textStyle,
        recognizer: TapGestureRecognizer()
          ..onTap = onTap
      )
    ]));
  }
}

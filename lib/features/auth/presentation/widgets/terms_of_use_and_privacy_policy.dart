import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsOfUseAndPrivacyPolicy extends StatelessWidget {
  final Function()? onTapPrivacyPolicy;
  final Function()? onTapTermsOfUse;

  const TermsOfUseAndPrivacyPolicy({
    super.key,
    required this.onTapPrivacyPolicy,
    required this.onTapTermsOfUse,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppColor.gray,
          fontWeight: FontWeight.w500,
        );

    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: AppColor.primary, fontWeight: FontWeight.w500);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(
              text: AppLocalizations.of(context)!.on_click_create_account,
              style: defaultStyle),
          TextSpan(
            text: AppLocalizations.of(context)!.terms_of_use,
            style: textStyle,
            recognizer: TapGestureRecognizer()..onTap = null,
          ),
          TextSpan(text: AppLocalizations.of(context)!.and, style: defaultStyle),
          TextSpan(
            text: AppLocalizations.of(context)!.privacy_policy,
            style: textStyle,
            recognizer: TapGestureRecognizer()..onTap = onTapPrivacyPolicy,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/auth_title.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/verify_account_screen/widgets/resend_code.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/spacing.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          AuthTitle(title: "verify_account"),
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_verify_account"),
          const SizedBox(height: medium),
          ResendCode(onTap: () {}),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: MButton(
              text: "validate",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.main,
                (route) => false,
              ),
            ),
          )
        ],
      ),
    );
  }
}

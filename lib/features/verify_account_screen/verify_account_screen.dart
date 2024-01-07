import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/verify_account_screen/widgets/resend_code.dart';
import 'package:qpay/utils/spacing.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "verify_account"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_verify_account"),
          const SizedBox(height: medium),
          ResendCode(),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: MButton(
              text: "validate",
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

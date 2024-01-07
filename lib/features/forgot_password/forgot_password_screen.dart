import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/utils/spacing.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _electronicAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "forgot_password"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_forgot_password"),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: MTextField(
              controller: _electronicAddress,
              label: "electronic_address",
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: MButton(
              text: "send_code",
              onTap: () {},
            ),
          )
        ],
      ),
    );
    ;
  }
}

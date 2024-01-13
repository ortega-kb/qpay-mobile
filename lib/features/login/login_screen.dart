import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/auth_title.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/common/widgets/m_outlined_button.dart';
import 'package:qpay/common/widgets/m_text_field.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/features/login/widgets/forgot_password.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    this._emailController.dispose();
    this._passwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          AuthTitle(title: "authentication"),
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_authentication"),
          const SizedBox(height: medium),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MTextField(
                    controller: _emailController,
                    label: "electronic_address",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: medium),
                  MTextField(
                    controller: _passwdController,
                    label: "passwd",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: medium),
                  ForgotPassword(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.forgotPassword),
                  ),
                  const SizedBox(height: medium),
                  MButton(
                    text: "login",
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.main,
                      (route) => false,
                    ),
                  ),
                  const SizedBox(height: medium),
                  MOutlinedButton(
                    text: "create_account",
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.register),
                  ),
                  const SizedBox(height: large),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

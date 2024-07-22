import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/widgets/privacy_policy.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_subtitle.dart';

import '../../../../core/shared/widgets/m_button.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/auth_title.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppDimen.p64),
            AuthTitle(
              title: AppLocalizations.of(context)!.connection,
            ),
            const SizedBox(height: AppDimen.p16),
            AuthSubtitle(title: AppLocalizations.of(context)!.text_connection),
            const SizedBox(height: AppDimen.p16),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MTextField(
                      controller: _phoneController,
                      label: AppLocalizations.of(context)!.phone_number,
                      prefixIcon: Column(
                        children: [
                          Text(
                            "🇨🇩 +243 ",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColor.gray),
                          )
                        ],
                      ),
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        return Validator.phoneValidator(value!);
                      },
                    ),
                    const SizedBox(height: AppDimen.p16),
                    MTextField(
                      controller: _passwordController,
                      label: AppLocalizations.of(context)!.passwd,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        return Validator.passwordValidator(value!);
                      },
                    ),
                    const SizedBox(height: AppDimen.p16),
                    MButton(
                      text: AppLocalizations.of(context)!.login,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: AppDimen.p16),
                    MButton(
                      text: AppLocalizations.of(context)!.login,
                      onPressed: () {
                        privacyPolicy(
                          context: context,
                          onTap: () async {
                          },
                        );
                      },
                    ),
                    const SizedBox(height: AppDimen.p8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

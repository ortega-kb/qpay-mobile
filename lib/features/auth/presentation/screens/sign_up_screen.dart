import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/m_button.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_dimen.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/auth_title.dart';
import '../widgets/sign_in_sign_up_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppDimen.p32),
            AuthTitle(title: AppLocalizations.of(context)!.creating_account),
            const SizedBox(height: AppDimen.p16),
            AuthSubtitle(title: AppLocalizations.of(context)!.text_connection),
            const SizedBox(height: AppDimen.p32),
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
                    MButton(
                      text: AppLocalizations.of(context)!.create_account,
                      onPressed: () {},
                    )
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

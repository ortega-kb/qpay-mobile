import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_subtitle.dart';
import 'package:qpay/features/auth/presentation/widgets/m_password_field.dart';
import 'package:qpay/features/auth/presentation/widgets/sign_in_sign_up_text.dart';

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
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _auth = LocalAuthentication();

  Future<bool> hasBiometrics() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  Future<bool> authenticate() async {
    final isAuthAvailable = await hasBiometrics();
    if (!isAuthAvailable) return false;
    try {
      return await _auth.authenticate(
          localizedReason: 'Touch your finger on the sensor to login',
          options: const AuthenticationOptions(useErrorDialogs: false)
    );
    } catch (e) {
    return false;
    }
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
            AuthTitle(title: AppLocalizations.of(context)!.connection),
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
                    MPasswordField(
                      controller: _passwordController,
                      label: AppLocalizations.of(context)!.passwd,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return Validator.passwordValidator(value!);
                      },
                    ),
                    const SizedBox(height: AppDimen.p16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.forgot_password,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppDimen.p16),
                    MButton(
                      text: AppLocalizations.of(context)!.login,
                      onPressed: () async {
                        final isAuthenticated = await authenticate();
                        if (isAuthenticated) {
                          Messages.success("Auth", "Auth success", context);
                        } else {
                          Messages.error("Auth", "Auth failed", context);
                        }
                      },
                    ),
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

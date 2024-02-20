import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/provider/m_password_field_provider.dart';
import 'package:qpay/feature/auth/screen/register_screen.dart';

import '../../../core/design/common/widgets/auth_title.dart';
import '../../../core/design/common/widgets/full_progress_indicator.dart';
import '../../../core/design/common/widgets/m_button.dart';
import '../../../core/design/common/widgets/m_outlined_button.dart';
import '../../../core/design/common/widgets/m_text_field.dart';
import '../../../core/design/common/widgets/subtitle.dart';
import '../../../core/design/spacing.dart';
import '../../../core/design/validator.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();

  @override
  void dispose() {
    this._phoneController.dispose();
    this._passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: FullProgressIndicator(),
      inAsyncCall: false,
      opacity: 0.3,
      blur: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: extraLarge),
              AuthTitle(title: "authentication"),
              const SizedBox(height: middleSmall),
              Subtitle(text: "subtitle_authentication"),
              const SizedBox(height: medium),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: medium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MTextField(
                        controller: _phoneController,
                        label: "phone_number",
                        prefixIcon: Column(
                          children: [
                            Text(
                              "🇨🇩 +243 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: gray),
                            )
                          ],
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return Validator.phoneValidator(value!);
                        },
                      ),
                      const SizedBox(height: medium),
                      MTextField(
                        controller: _passwdController,
                        label: "passwd",
                        obscureText: ref.watch(mPasswordFieldProvider),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return Validator.passwordValidator(value);
                        },
                        suffixIcon: ref.watch(mPasswordFieldProvider)
                            ? IconButton(
                                onPressed: () {
                                  ref
                                      .read(mPasswordFieldProvider.notifier)
                                      .setObscuredText(false);
                                },
                                icon: Icon(CupertinoIcons.eye_solid))
                            : IconButton(
                                onPressed: () {
                                  ref
                                      .read(mPasswordFieldProvider.notifier)
                                      .setObscuredText(true);
                                },
                                icon: Icon(
                                  CupertinoIcons.eye_slash_fill,
                                ),
                              ),
                      ),
                      const SizedBox(height: medium),
                      // ForgotPassword(
                      //   onTap: () => Navigator.pushNamed(
                      //       context, AppRoutes.forgotPassword),
                      // ),
                      const SizedBox(height: medium),
                      MButton(
                        text: "login",
                        onTap: () async {
                          // if (_formKey.currentState!.validate()) {
                          //   if (!await viewModel.signInWithEmailAndPassword(
                          //     _emailController.text.trim(),
                          //     _passwdController.text.trim(),
                          //   )) {
                          //     Messages.error(
                          //         "Erreur d'authentification", context);
                          //   } else {
                          //     Navigator.pushNamedAndRemoveUntil(
                          //       context,
                          //       AppRoutes.main,
                          //       (route) => false,
                          //     );
                          //   }
                          // }
                        },
                      ),
                      const SizedBox(height: medium),
                      MOutlinedButton(
                        text: "create_account",
                        onTap: () {
                          Navigator.push(
                            context,
                            animateRoute(
                              RegisterScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: large),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

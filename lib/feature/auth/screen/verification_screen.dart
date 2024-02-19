import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/color.dart';
import '../../../core/design/common/widgets/auth_title.dart';
import '../../../core/design/common/widgets/m_button.dart';
import '../../../core/design/common/widgets/m_text_field.dart';
import '../../../core/design/spacing.dart';
import '../../../core/design/validator.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  ConsumerState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends ConsumerState<VerificationScreen> {
  TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: extraLarge),
            AuthTitle(title: "verification_code"),
            const SizedBox(height: middleSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: medium),
                LocaleText(
                  "sent_verification_code",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: gray),
                ),
                const SizedBox(width: small),
                Text(
                  widget.phoneNumber,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    color: gray,
                  ),
                ),
              ],
            ),
            const SizedBox(height: medium),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MTextField(
                      controller: _otpController,
                      label: "verification_code",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return Validator.emailValidator(value);
                      },
                    ),
                    const SizedBox(height: medium),
                    MButton(
                      text: "verify",
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
                    const SizedBox(height: large),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

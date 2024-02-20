import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/operations.dart';
import 'package:qpay/feature/register/register_state.dart';
import 'package:qpay/feature/register/register_view_model.dart';
import 'package:qpay/feature/verification/verification_screen.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/full_progress_indicator.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/messages.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerViewModelProvider);

    ref.listen(registerViewModelProvider, (previous, next) {
      if (next is Error) {
        Messages.error(next.e.toString(), context);
      } else if (next is Success) {
        Navigator.push(
          context,
          animateRoute(
            VerificationScreen(
              phoneNumber: Operations().concatPhoneNumber(
                _phoneController.text.trim(),
              ),
              verificationId: next.e,
            ),
          ),
        );
      }
    });

    return ModalProgressHUD(
      progressIndicator: FullProgressIndicator(),
      inAsyncCall: (state is Loading) ? true : false,
      opacity: 0.3,
      blur: 1,
      child: Scaffold(
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
              AuthTitle(title: "create_an_account"),
              const SizedBox(height: middleSmall),
              Subtitle(text: "enter_phone_number"),
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
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return Validator.phoneValidator(value!);
                        },
                      ),
                      const SizedBox(height: medium),
                      MButton(
                        text: "next",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(registerViewModelProvider.notifier)
                                .sendOtp(
                                  Operations().concatPhoneNumber(
                                    _phoneController.text.trim(),
                                  ),
                                );
                          }
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

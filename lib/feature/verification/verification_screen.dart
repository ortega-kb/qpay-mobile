import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/feature/information/information_screen.dart';
import 'package:qpay/feature/verification/verification_state.dart';
import 'package:qpay/feature/verification/verification_view_model.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/full_progress_indicator.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/messages.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const VerificationScreen(
      {super.key, required this.phoneNumber, required this.verificationId});

  @override
  ConsumerState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final TextEditingController _optController = TextEditingController();

  @override
  void dispose() {
    _optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verificationViewModelProvider);

    ref.listen(
      verificationViewModelProvider,
      (previous, next) {
        if (next is Error) {
          Messages.error(next.e.toString(), context);
        } else if (next is Success) {
          Navigator.push(context, animateRoute(InformationScreen()));
        }
      },
    );

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
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
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
                        controller: _optController,
                        label: "verification_code",
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return Validator.emailValidator(value);
                        },
                      ),
                      const SizedBox(height: medium),
                      MButton(
                        text: "verify",
                        onTap: () async {
                          ref
                              .read(verificationViewModelProvider.notifier)
                              .loginWithOtp(
                                otp: _optController.text.trim(),
                                verificationId: widget.verificationId,
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

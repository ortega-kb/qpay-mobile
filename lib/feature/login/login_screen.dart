import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/messages.dart';
import 'package:qpay/feature/login/login_state.dart';
import 'package:qpay/feature/login/login_view_model.dart';

import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/full_progress_indicator.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_outlined_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/spacing.dart';
import '../../core/design/validator.dart';
import '../register/register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);

    ref.listen(loginViewModelProvider, (previous, next) {
      if (next is Error) {
        Messages.error(next.e.toString(), context);
      } else if (next is Success) {
        Messages.success("Login success", context);
      }
    });

    return ModalProgressHUD(
      progressIndicator: FullProgressIndicator(),
      inAsyncCall: (state is Loading) ? true : false,
      opacity: 0.3,
      blur: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: extraLarge),
              Center(
                child: AuthTitle(
                  title: AppLocalizations.of(context)!.connection,
                ),
              ),
              const SizedBox(height: middleSmall),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: medium),
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
                        text: AppLocalizations.of(context)!.login,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(loginViewModelProvider.notifier)
                                .login(_phoneController.text.trim());
                          }
                        },
                      ),
                      const SizedBox(height: small),
                      Center(
                        child: Subtitle(
                          text: AppLocalizations.of(context)!.or,
                        ),
                      ),
                      const SizedBox(height: small),
                      MOutlinedButton(
                        text: AppLocalizations.of(context)!.create_account,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_subtitle.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/features/auth/presentation/widgets/m_password_field.dart';

class UserInformationScreen extends StatefulWidget {
  final String phone;
  const UserInformationScreen({super.key, required this.phone});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _pinController = TextEditingController();
  final _pinConfirmController = TextEditingController();
  final _accountTypeController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _pinConfirmController.dispose();
    _pinController.dispose();
    _accountTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimen.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimen.p32),
                AuthTitle(
                  title: AppLocalizations.of(context)!.complete_your_profil,
                ),
                const SizedBox(height: AppDimen.p16),
                AuthSubtitle(
                  title:
                      AppLocalizations.of(context)!.enter_correctly_information,
                ),
                const SizedBox(height: AppDimen.p32),
                MTextField(
                  controller: _fullNameController,
                  label: AppLocalizations.of(context)!.full_name,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: AppDimen.p16),
                MPasswordField(
                  controller: _pinController,
                  label: AppLocalizations.of(context)!.pin,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppDimen.p16),
                MPasswordField(
                  controller: _pinConfirmController,
                  label: AppLocalizations.of(context)!.pin_confirm,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppDimen.p16),
                MTextField(
                  controller: _accountTypeController,
                  label: AppLocalizations.of(context)!.account_type,
                  obscureText: false,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: AppDimen.p16),
                MButton(
                  text: AppLocalizations.of(context)!.finish,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

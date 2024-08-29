import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/core/shared/widgets/account_type_tile.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_progress.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/shared/widgets/select_account_type.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/enums/account_type.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/validator.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
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
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _accountTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _accountTypeController.text = AccountType.PUBLIC.name;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordConfirmController.dispose();
    _passwordController.dispose();
    _accountTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignUpErrorState) {
          Messages.error(
            AppLocalizations.of(context)!.authentication,
            state.errorMessage,
            context,
          );
        }

        if (state is AuthPasswordsDoesntMatchState) {
          Messages.error(
            AppLocalizations.of(context)!.passwd,
            AppLocalizations.of(context)!.passwords_doesnt_match,
            context,
          );
        }
      },
      builder: (context, state) {
        return MProgress(
          inAsyncCall: state is AuthLoadingState,
          child: Scaffold(
            appBar: AppBar(),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimen.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppDimen.p16),
                      AuthTitle(
                        title:
                            AppLocalizations.of(context)!.complete_your_profil,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      AuthSubtitle(
                        title: AppLocalizations.of(context)!
                            .enter_correctly_information,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _fullNameController,
                        label: AppLocalizations.of(context)!.full_name,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return Validator.nameValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MPasswordField(
                        controller: _passwordController,
                        label: AppLocalizations.of(context)!.passwd,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return Validator.passwordValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MPasswordField(
                        controller: _passwordConfirmController,
                        label: AppLocalizations.of(context)!.confirm_password,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return Validator.passwordValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _accountTypeController,
                        label: AppLocalizations.of(context)!.account_type,
                        obscureText: false,
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        onTap: () {
                          selectAccountType(
                            context: context,
                            widgets: [
                              AccountTypeTile(
                                accountType:
                                    AppLocalizations.of(context)!.public,
                                onTap: () {
                                  setState(() {
                                    _accountTypeController.text =
                                        AccountType.PUBLIC.name;
                                  });
                                  Navigator.pop(context);
                                },
                                isChecked: _accountTypeController.text ==
                                    AccountType.PUBLIC.name,
                              ),
                              AccountTypeTile(
                                accountType:
                                    AppLocalizations.of(context)!.corporate,
                                onTap: () {
                                  setState(() {
                                    _accountTypeController.text =
                                        AccountType.CORPORATE.name;
                                  });
                                  Navigator.pop(context);
                                },
                                isChecked: _accountTypeController.text ==
                                    AccountType.CORPORATE.name,
                              ),
                              AccountTypeTile(
                                accountType:
                                    AppLocalizations.of(context)!.dealer,
                                onTap: () {
                                  setState(() {
                                    _accountTypeController.text =
                                        AccountType.DEALER.name;
                                  });
                                  Navigator.pop(context);
                                },
                                isChecked: _accountTypeController.text ==
                                    AccountType.DEALER.name,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MButton(
                        text: AppLocalizations.of(context)!.finish,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_passwordController.text.trim() ==
                                _passwordConfirmController.text.trim()) {
                              context.read<AuthBloc>().add(AuthSignUpEvent(
                                    phone: widget.phone,
                                    email: '',
                                    fullName: _fullNameController.text.trim(),
                                    password: _passwordController.text,
                                    accountType:
                                        _accountTypeController.text.trim(),
                                  ));
                            } else {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthPasswordsDoesntMatchEvent());
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

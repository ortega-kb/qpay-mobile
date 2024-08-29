import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/cubits/account_type_cubit.dart';
import 'package:qpay/core/shared/widgets/account_type_tile.dart';
import 'package:qpay/core/shared/widgets/m_progress.dart';
import 'package:qpay/core/shared/widgets/select_account_type.dart';
import 'package:qpay/core/utils/enums/account_type.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:qpay/features/auth/presentation/widgets/m_password_field.dart';
import 'package:qpay/features/auth/presentation/widgets/terms_of_use_and_privacy_policy.dart';

import '../../../../core/shared/widgets/m_button.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_dimen.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/auth_subtitle.dart';
import '../widgets/auth_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _accountTypeController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _accountTypeController.text = AccountType.PUBLIC.name;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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

        if (state is AuthSignUpSuccessState) {
          context.push('/verify-phone-number', extra: _phoneController.text.trim());
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
                  padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppDimen.p16),
                      AuthTitle(
                        title: AppLocalizations.of(context)!.creating_account,
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
                          return Validator.passwordValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      BlocBuilder<AccountTypeCubit, String>(
                        builder: (context, state) {
                          _accountTypeController.text = state;
                          return MTextField(
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
                                      context
                                          .read<AccountTypeCubit>()
                                          .updateAccountType(
                                            AccountType.PUBLIC,
                                          );
                                      Navigator.pop(context);
                                    },
                                    isChecked: _accountTypeController.text ==
                                        AccountType.PUBLIC.name,
                                  ),
                                  AccountTypeTile(
                                    accountType:
                                        AppLocalizations.of(context)!.corporate,
                                    onTap: () {
                                      context
                                          .read<AccountTypeCubit>()
                                          .updateAccountType(
                                            AccountType.CORPORATE,
                                          );
                                      Navigator.pop(context);
                                    },
                                    isChecked: _accountTypeController.text ==
                                        AccountType.CORPORATE.name,
                                  ),
                                  AccountTypeTile(
                                    accountType:
                                        AppLocalizations.of(context)!.dealer,
                                    onTap: () {
                                      context
                                          .read<AccountTypeCubit>()
                                          .updateAccountType(
                                            AccountType.DEALER,
                                          );
                                      Navigator.pop(context);
                                    },
                                    isChecked: _accountTypeController.text ==
                                        AccountType.DEALER.name,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MButton(
                        text: AppLocalizations.of(context)!.create_account,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUpEvent(
                                    phone: _phoneController.text.trim(),
                                    email: '',
                                    fullName: _fullNameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    accountType: _accountTypeController.text.trim(),
                                  ),
                                );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: TermsOfUseAndPrivacyPolicy(
                  onTapPrivacyPolicy: () {},
                  onTapTermsOfUse: () {},
                )),
          ),
        );
      },
    );
  }
}

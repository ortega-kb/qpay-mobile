import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/cubits/timer_otp_cubit.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_outlined_button.dart';
import 'package:qpay/core/shared/widgets/m_progress.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/validator.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_subtitle.dart';
import 'package:qpay/features/auth/presentation/widgets/auth_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  final String phone;
  const VerifyPhoneNumberScreen({super.key, required this.phone});

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpCodeController = TextEditingController();

  @override
  void initState() {
    context.read<TimerOtpCubit>().startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.reset();
    _otpCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthVerifyPhoneNumberSuccessState) {
          Messages.success(
            AppLocalizations.of(context)!.verification_code,
            AppLocalizations.of(context)!.successful_verification,
            context,
          );

          context.go('/sign-in');
        }
        if (state is AuthVerifyPhoneNumberErrorState) {
          Messages.error(
            AppLocalizations.of(context)!.verification_code,
            AppLocalizations.of(context)!.verification_failed,
            context,
          );
        }
        if (state is AuthResendOtpSuccessState) {
          context.read<TimerOtpCubit>().startTimer();
          Messages.success(
            AppLocalizations.of(context)!.otp_code,
            AppLocalizations.of(context)!.resent_otp_code,
            context,
          );
        }
        if (state is AuthResendOtpErrorState) {
          Messages.error(
            AppLocalizations.of(context)!.otp_code,
            AppLocalizations.of(context)!.failed_resent_otp_code,
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
                        title: AppLocalizations.of(context)!.verification,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      AuthSubtitle(
                        title: AppLocalizations.of(context)!
                            .enter_6_digits_sent_to(widget.phone),
                      ),
                      const SizedBox(height: AppDimen.p32),
                      MTextField(
                        controller: _otpCodeController,
                        label: AppLocalizations.of(context)!.otp_code,
                        obscureText: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MButton(
                        text: AppLocalizations.of(context)!.verify,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthVerifyPhoneNumberEvent(
                                    phone: widget.phone,
                                    otp: _otpCodeController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: AppDimen.p8),
                      BlocBuilder<TimerOtpCubit, int>(
                        builder: (context, state) {
                          return MOutlinedButton(
                            text:
                                AppLocalizations.of(context)!.resend_sms(state),
                            onPressed: state > 0
                                ? () {}
                                : () {
                                    context.read<AuthBloc>().add(
                                        AuthResendOtpEvent(
                                            phone: widget.phone));
                                  },
                          );
                        },
                      )
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

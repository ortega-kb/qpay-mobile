import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/cubits/home_navigation_cubit.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/settings_item.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/shared/widgets/item_container.dart';
import 'package:qpay/core/utils/external_link.dart';
import 'package:qpay/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/screens/account_screen.dart';
import '../../../auth/presentation/screens/on_boarding_screen.dart';
import '../../../customized_logo/presentation/screen/customized_logo_screen.dart';
import '../../../language/presentation/screens/language_screen.dart';
import '../../../qr_code/presentation/screens/my_qr_code_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void confirmSignOut() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.p16),
            ),
            title: Text(AppLocalizations.of(context)!.logout),
            content: Text(AppLocalizations.of(context)!.confirm_sign_out),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignOutEvent());
                  context.read<HomeNavigationCubit>().navigate(0);
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              ItemContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.my_qr_code,
                      iconData: FluentIcons.qr_code_24_filled,
                      onTap: () => context.push(MyQrCodeScreen.route),
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_user,
                      iconData: FluentIcons.person_accounts_24_filled,
                      onTap: () => context.push(AccountScreen.route),
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.privacy,
                      iconData: Icons.security_rounded,
                      onTap: () => ExternalLink.privacy(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              ItemContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.languages,
                      iconData: FluentIcons.translate_24_regular,
                      onTap: () => context.push(LanguageScreen.route),
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.customized_logo,
                      iconData: FluentIcons.picture_in_picture_24_filled,
                      onTap: () => context.push(CustomizedLogoScreen.route),
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.notifications,
                      iconData: FluentIcons.alert_24_filled,
                      onTap: () => context.push(NotificationsScreen.route),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              ItemContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.support,
                      iconData: FluentIcons.accessibility_question_mark_24_filled,
                      onTap: () => ExternalLink.emailSupport(context),
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.rate_app,
                      iconData: FluentIcons.star_24_filled,
                      onTap: () {},
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.share_app,
                      iconData: FluentIcons.share_24_filled,
                      onTap: () => Share.shareUri(
                        Uri.parse("https://www.google.com"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSignOutSuccessState) {
                    context.go(OnBoardingScreen.route);
                  }
                },
                builder: (context, state) {
                  return ItemContainer(
                    content: SettingsItem(
                      hasNext: false,
                      title: AppLocalizations.of(context)!.logout,
                      iconData: FluentIcons.sign_out_24_filled,
                      onTap: () => confirmSignOut(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

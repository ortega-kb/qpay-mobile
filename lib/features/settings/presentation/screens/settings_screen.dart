import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/settings_item.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/settings/presentation/widgets/settings_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimen.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.my_qr_code,
                      iconData: FluentIcons.qr_code_24_filled,
                      onTap: () {},
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_user,
                      iconData: FluentIcons.person_accounts_24_filled,
                      onTap: () {},
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.privacy,
                      iconData: Icons.security_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.languages,
                      iconData: FluentIcons.translate_24_regular,
                      onTap: () {},
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.customized_logo,
                      iconData: FluentIcons.picture_in_picture_24_filled,
                      onTap: () {},
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.notifications,
                      iconData: FluentIcons.alert_24_filled,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.support,
                      iconData: FluentIcons.accessibility_question_mark_24_filled,
                      onTap: () {},
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: SettingsItem(
                  hasNext: false,
                  title: AppLocalizations.of(context)!.logout,
                  iconData: FluentIcons.sign_out_24_filled,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

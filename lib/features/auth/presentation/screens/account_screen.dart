import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/settings_item.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/settings/presentation/widgets/settings_container.dart';

import '../../../../di/dependencies.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account_user),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.modify_informations,
            onPressed: () {},
            icon: Icon(
              FluentIcons.edit_person_20_filled,
              size: 22,
            ),
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_user,
                      subtitle: locator<UserInformationService>().username,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.user_code,
                      subtitle: locator<UserInformationService>().userCode,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_type,
                      subtitle: locator<UserInformationService>().accountType,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.phone_number,
                      subtitle: locator<UserInformationService>().phoneNumber,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              SettingsContainer(
                content: SettingsItem(
                  title: AppLocalizations.of(context)!.delete_account,
                  onTap: () {},
                  iconData: FluentIcons.delete_24_filled,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

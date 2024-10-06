import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/settings_item.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/shared/widgets/item_container.dart';

import '../../../../di/dependencies.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static String path = 'account';
  static String route = '/account';

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
              ItemContainer(
                content: Column(
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_user,
                      subtitle: sl<UserInformationService>().username,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.user_code,
                      subtitle: sl<UserInformationService>().userCode,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.account_type,
                      subtitle: sl<UserInformationService>().accountType,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                    Separator(isLarge: false),
                    SettingsItem(
                      title: AppLocalizations.of(context)!.phone_number,
                      subtitle: sl<UserInformationService>().phoneNumber,
                      onTap: () {},
                      iconData: null,
                      hasNext: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimen.p16),
              ItemContainer(
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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/shared/widgets/title_section.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/extensions/datetime_extension.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/di/dependencies.dart';

import '../../../../core/utils/recognize_provider.dart';
import '../bloc/wallet_bloc.dart';

class WalletDetailsScreen extends StatelessWidget {
  final Wallet wallet;

  const WalletDetailsScreen({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    void confirmDeleteWallet(String index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.p16),
            ),
            title: Text(AppLocalizations.of(context)!.delete),
            content: Text(AppLocalizations.of(context)!.confirm_delete_wallet),
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
                  context
                      .read<WalletBloc>()
                      .add(WalletDeleteEvent(walletId: index));
                  Navigator.pop(context);
                  context.pop(context);
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

    void confirmSetAsDefaultWallet(String index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.p16),
            ),
            title: Text(AppLocalizations.of(context)!.set_as_default),
            content: Text(AppLocalizations.of(context)!.confirm_set_as_default),
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
                  context.read<WalletBloc>().add(
                        WalletChooseDefaultEvent(
                          walletId: index,
                          userCode: locator<UserInformationService>().userCode
                        ),
                      );
                  Navigator.pop(context);
                  context.pop(context);
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
        title: Text(AppLocalizations.of(context)!.wallet),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.delete_wallet,
            onPressed: () => confirmDeleteWallet(wallet.id!),
            icon: Icon(
              FluentIcons.delete_20_filled,
            ),
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppDimen.p16),
            WalletUSDCDF(),
            TitleSection(title: AppLocalizations.of(context)!.details),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimen.p16),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(AppDimen.p16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.code,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: Text(wallet.userCode),
                    ),
                    Separator(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.provider,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: Text(
                        wallet.providerType.capitalizeFirstLetter(),
                      ),
                    ),
                    Separator(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.phone_number,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: Text(wallet.walletPhone),
                    ),
                    Separator(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.default_wallet,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: wallet.defaultWallet
                          ? Text(
                              AppLocalizations.of(context)!.yes,
                              style: TextStyle(color: Colors.green),
                            )
                          : Text(
                              AppLocalizations.of(context)!.no,
                              style: TextStyle(color: Colors.red),
                            ),
                      trailing: wallet.defaultWallet
                          ? null
                          : TextButton(
                              onPressed: () =>
                                  confirmSetAsDefaultWallet(wallet.id!),
                              child: Text(AppLocalizations.of(context)!
                                  .set_as_default),
                            ),
                    ),
                    Separator(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.created_date,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      subtitle: Text(wallet.createdAt!.toDDMMYYYY()),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimen.p16),
          ],
        ),
      ),
    );
  }
}

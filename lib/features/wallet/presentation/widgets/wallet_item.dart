import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/leading_item.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/extensions/datetime_extension.dart';
import 'package:qpay/core/utils/recognize_provider.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletItem extends StatelessWidget {
  final Wallet wallet;
  final Function()? onTap;

  const WalletItem({
    super.key,
    required this.wallet,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: LeadingItem(iconData: FluentIcons.wallet_credit_card_24_filled),
      title: Text(
        wallet.walletPhone,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: RecognizeProvider.bindColorToProvider(wallet.walletPhone),
              borderRadius: BorderRadius.circular(
                AppDimen.p8,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimen.p2,
                horizontal: AppDimen.p8,
              ),
              child: Text(
                wallet.providerType.capitalizeFirstLetter(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColor.white,
                    ),
              ),
            ),
          ),
        ],
      ),
      trailing: wallet.defaultWallet
          ? Text(
              AppLocalizations.of(context)!.default_wallet,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                  ),
            )
          : null,
    );
  }
}

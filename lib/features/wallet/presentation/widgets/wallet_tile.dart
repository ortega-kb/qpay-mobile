import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/phone_to_country_code.dart';
import 'package:qpay/core/utils/recognize_provider.dart';
import 'package:qpay/features/qr_code/presentation/widgets/qr_static_tile.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';

class WalletTile extends StatelessWidget {
  final Wallet wallet;
  const WalletTile({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:
            LeadingTile(iconData: FluentIcons.wallet_credit_card_24_filled),
        title: Text(
          phoneToCountryCode(wallet.walletPhone),
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: RecognizeProvider.bindColorToProvider(wallet.walletPhone),
                  borderRadius: BorderRadius.circular(AppDimen.p8)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimen.p2,
                  horizontal: AppDimen.p8,
                ),
                child: Text(
                  wallet.providerType.toLowerCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColor.white,
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}

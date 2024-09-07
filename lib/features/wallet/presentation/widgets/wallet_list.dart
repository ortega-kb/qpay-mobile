import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/wallet/presentation/widgets/wallet_item.dart';

import '../../../../core/shared/widgets/not_found.dart';
import '../../../../core/utils/image_path.dart';
import '../../domain/entities/wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletList extends StatelessWidget {
  final List<Wallet> wallets;

  const WalletList({super.key, required this.wallets});

  @override
  Widget build(BuildContext context) {
    return wallets.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(vertical: AppDimen.p16),
            itemBuilder: (_, index) => WalletItem(wallet: wallets[index]),
            separatorBuilder: (_, index) => Separator(),
            itemCount: wallets.length,
          )
        : NotFound(
            image: ImagePath.emptyBro,
            message: AppLocalizations.of(context)!.wallets_not_found,
          );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/feature/home/widgets/quick_operation_tile.dart';
import 'package:qpay/feature/my_qr_code/qr_code_list_screen.dart';
import 'package:qpay/feature/transfer_money/transfer_money_screen.dart';

class QuickOperationList extends StatelessWidget {
  const QuickOperationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: medium),
          QuickOperationTile(
            title: AppLocalizations.of(context)!.transfer_money,
            icon: FontAwesomeIcons.arrowRightArrowLeft,
            onTap: () {
              Navigator.push(
                context,
                animateRoute(
                  TransferMoneyScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: middleSmall),
          QuickOperationTile(
            title: AppLocalizations.of(context)!.payment_link,
            icon: FontAwesomeIcons.link,
            onTap: () {},
          ),
          const SizedBox(width: middleSmall),
          QuickOperationTile(
            title: AppLocalizations.of(context)!.create_qr_code,
            icon: CupertinoIcons.qrcode,
            onTap: () {
              Navigator.push(
                context,
                animateRoute(
                  QrCodeListScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: medium),
        ],
      ),
    );
  }
}

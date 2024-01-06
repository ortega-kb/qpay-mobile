import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/deposit_withdraw_tile.dart';
import '../../common/widgets/line.dart';
import '../../common/widgets/tile_container.dart';
import '../../utils/constants/image_path.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "withdraw"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_withdraw"),
          const SizedBox(height: medium),
          TileContainer(
            child: Column(
              children: [
                DepositWithDrawTile(name: "Airtel Money", tarif: "4.5", image: ImagePath.airtelMoney),
                const Line(),
                DepositWithDrawTile(name: "M-Pesa", tarif: "3", image: ImagePath.mPesa),
                const Line(),
                DepositWithDrawTile(name: "Orange Money", tarif: "2.5", image: ""),
                const Line(),
                DepositWithDrawTile(name: "Afrimoney", tarif: "3", image: ImagePath.afriMoney)
              ],
            ),
          )
        ],
      ),
    );
  }
}

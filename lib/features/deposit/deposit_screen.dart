import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/deposit_withdraw_tile.dart';
import 'package:qpay/common/widgets/line.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/common/widgets/tile_container.dart';
import 'package:qpay/utils/constants/image_path.dart';
import 'package:qpay/utils/spacing.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "deposit"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Subtitle(text: "subtitle_deposit"),
          const SizedBox(height: medium),
          TileContainer(
            child: Column(
              children: [
                DepositWithDrawTile(name: "Airtel Money", tarif: "4.5", image: ImagePath.airtelMoney),
                const Line(),
                DepositWithDrawTile(name: "M-Pesa", tarif: "3", image: ImagePath.mPesa),
                const Line(),
                DepositWithDrawTile(name: "Orange Money", tarif: "2.5", image: ImagePath.orangeMoney),
                const Line(),
                DepositWithDrawTile(name: "Afrimoney", tarif: "3", image: ImagePath.afriMoney),
                const Line(),
                DepositWithDrawTile(name: "Carte de crédit", tarif: "4", image: ImagePath.visa),
              ],
            ),
          )
        ],
      ),
    );
  }
}

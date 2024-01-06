import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "transfer_money"),
      ),
    );
  }
}

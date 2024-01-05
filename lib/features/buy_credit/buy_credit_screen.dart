import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/my_title.dart';

class BuyCreditScreen extends StatelessWidget {
  const BuyCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "credit"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';

class BuyCreditScreen extends StatelessWidget {
  const BuyCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "credit"),
      ),
    );
  }
}

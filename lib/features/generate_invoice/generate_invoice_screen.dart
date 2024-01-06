import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/utils/spacing.dart';

class GenerateInvoiceScreen extends StatelessWidget {
  const GenerateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "invoice"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium)
        ],
      ),
    );
  }
}

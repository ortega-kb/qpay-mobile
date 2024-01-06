import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/utils/color.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: MTitle(text: "qr_code_payment"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      )
    );
  }
}

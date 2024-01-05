import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/my_title.dart';

class MyQrCodeScreen extends StatelessWidget {
  const MyQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "my_qr_code"),
      ),
    );
  }
}

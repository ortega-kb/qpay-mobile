import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:qpay/common/widgets/my_title.dart';

class FactureScreen extends StatelessWidget {
  const FactureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "facture"),
      ),
    );
  }
}

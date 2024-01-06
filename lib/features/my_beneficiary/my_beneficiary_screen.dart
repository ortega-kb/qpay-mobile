import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';

class MyBeneficiaryScreen extends StatelessWidget {
  const MyBeneficiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "my_beneficiary"),
      ),
    );
  }
}

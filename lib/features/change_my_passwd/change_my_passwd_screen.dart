import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/m_title.dart';

class ChangeMyPasswdScreen extends StatelessWidget {
  const ChangeMyPasswdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "change_my_passwd"),
      ),
    );
  }
}

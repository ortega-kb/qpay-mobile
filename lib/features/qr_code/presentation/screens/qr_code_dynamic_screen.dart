import 'package:flutter/material.dart';

class QrCodeDynamicScreen extends StatefulWidget {
  const QrCodeDynamicScreen({super.key});

  @override
  State<QrCodeDynamicScreen> createState() => _QrCodeDynamicScreenState();
}

class _QrCodeDynamicScreenState extends State<QrCodeDynamicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(),
    );
  }
}

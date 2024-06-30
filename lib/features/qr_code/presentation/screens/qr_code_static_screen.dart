import 'package:flutter/material.dart';

class QrCodeStaticScreen extends StatefulWidget {
  const QrCodeStaticScreen({super.key});

  @override
  State<QrCodeStaticScreen> createState() => _QrCodeStaticScreenState();
}

class _QrCodeStaticScreenState extends State<QrCodeStaticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(),
    );
  }
}

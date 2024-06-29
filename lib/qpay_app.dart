import 'package:flutter/material.dart';
import 'package:qpay/qpay_app_wrapper.dart';

class QpayApp extends StatefulWidget {
  const QpayApp({super.key});

  @override
  State<QpayApp> createState() => _QpayAppState();
}

class _QpayAppState extends State<QpayApp> {
  @override
  Widget build(BuildContext context) {
    return QpayAppWrapper();
  }
}

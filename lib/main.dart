import 'package:flutter/material.dart';
import 'package:qpay/init_dependencies.dart';
import 'package:qpay/qpay_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(const QpayApp());
}

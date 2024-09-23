import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/di/dependencies.dart';
import 'package:qpay/qpay_app.dart';
import 'package:qpay/qpay_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies();

  Bloc.observer = QpayBlocObserver();
  runApp(const QpayApp());
}

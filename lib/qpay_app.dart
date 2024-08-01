import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/init_dependencies.dart';
import 'package:qpay/qpay_app_wrapper.dart';

import 'features/qr_code/presentation/bloc/qr_code_bloc.dart';


class QpayApp extends StatefulWidget {
  const QpayApp({super.key});

  @override
  State<QpayApp> createState() => _QpayAppState();
}

class _QpayAppState extends State<QpayApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<QRCodeBloc>())
      ],
      child: QpayAppWrapper(),
    );
  }
}

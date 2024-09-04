import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/core/shared/cubits/account_type_cubit.dart';
import 'package:qpay/features/auth/presentation/bloc/cubits/timer_otp_cubit.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:qpay/features/dashboard/presentation/bloc/cubits/time_report_cubit.dart';
import 'package:qpay/features/dashboard/presentation/bloc/cubits/wallet_page_cubit.dart';
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
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<QRCodeBloc>()),
        BlocProvider(create: (_) => TimerOtpCubit()),
        BlocProvider(create: (_) => AccountTypeCubit()),
        BlocProvider(create: (_) => WalletPageCubit()),
        BlocProvider(create: (_) => TimeReportCubit()),
      ],
      child: QpayAppWrapper(),
    );
  }
}

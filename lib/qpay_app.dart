import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/cubits/account_type_cubit.dart';
import 'package:qpay/core/shared/cubits/home_navigation_cubit.dart';
import 'package:qpay/core/shared/cubits/language/language_cubit.dart';
import 'package:qpay/core/shared/cubits/network/network_cubit.dart';
import 'package:qpay/core/shared/cubits/wallet_show_hide_cubit.dart';
import 'package:qpay/features/auth/presentation/bloc/cubits/timer_otp_cubit.dart';
import 'package:qpay/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:qpay/features/dashboard/presentation/bloc/cubits/time_report_cubit.dart';
import 'package:qpay/core/shared/cubits/wallet_page_cubit.dart';
import 'package:qpay/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:qpay/di/dependencies.dart';

import 'config/configs.dart';
import 'core/shared/services/shared_preferences_service.dart';
import 'core/theme/app_theme.dart';
import 'features/qr_code/presentation/bloc/qr_code_bloc.dart';

class QpayApp extends StatelessWidget {
  const QpayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<QRCodeBloc>()),
        BlocProvider(create: (_) => locator<WalletBloc>()),
        BlocProvider(create: (_) => TimerOtpCubit()),
        BlocProvider(create: (_) => AccountTypeCubit()),
        BlocProvider(create: (_) => WalletPageCubit()),
        BlocProvider(create: (_) => TimeReportCubit()),
        BlocProvider(create: (_) => NetworkCubit()),
        BlocProvider(create: (_) => WalletShowHideCubit()),
        BlocProvider(create: (_) => HomeNavigationCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'QpayApp',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [
                Locale('fr'),
                Locale('en'),
              ],
              routerConfig: AppRouterConfig(locator<SharedPreferencesService>())
                  .router,
              locale: Locale(context.watch<LanguageCubit>().state.language),
              theme: AppTheme.lightTheme
          );
        }
      ),
    );
  }
}

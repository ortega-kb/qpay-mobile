import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/config/app_router_config.dart';
import 'package:qpay/core/utils/constants.dart';

class QpayAppWrapper extends StatefulWidget {
  const QpayAppWrapper({super.key});

  @override
  State<QpayAppWrapper> createState() => _QpayAppWrapperState();
}

class _QpayAppWrapperState extends State<QpayAppWrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'QpayApp',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('fr'),
        Locale('en')
      ],
      locale: Constants.locale,
      routerConfig: AppRouterConfig().router,
    );
  }
}
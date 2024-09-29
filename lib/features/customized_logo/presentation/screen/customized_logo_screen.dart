import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomizedLogoScreen extends StatelessWidget {
  const CustomizedLogoScreen({super.key});

  static get path => 'customized-logo';
  static get route => '/customized-logo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.customized_logo),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}

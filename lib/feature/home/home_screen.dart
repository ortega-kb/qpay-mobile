import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/color.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: primary, child: Text("")),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppLocalizations.of(context)!.scan_qr_code,
            icon: Icon(
              CupertinoIcons.qrcode_viewfinder,
            ),
          )
        ],
      ),
    );
  }
}

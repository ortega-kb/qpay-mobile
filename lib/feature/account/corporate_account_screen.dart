import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/spacing.dart';

class CorporateAccountScreen extends ConsumerStatefulWidget {
  const CorporateAccountScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<CorporateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: extraLarge),
            AuthTitle(
              title: AppLocalizations.of(context)!.account(
                AppLocalizations.of(context)!.corporate,
              ),
            ),
            const SizedBox(height: middleSmall),
            Subtitle(
              text: AppLocalizations.of(context)!.text_account,
            ),
            const SizedBox(
              height: middleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/design/common/widgets/auth_title.dart';
import '../../../core/design/common/widgets/subtitle.dart';
import '../../../core/design/spacing.dart';

class HeaderCorporateAccount extends StatelessWidget {
  const HeaderCorporateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

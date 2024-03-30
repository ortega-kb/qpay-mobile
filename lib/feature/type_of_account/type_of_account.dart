import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/provider/account_type_provider.dart';
import 'package:qpay/core/utils/enums/account_type.dart';
import 'package:qpay/feature/account/corporate_account_screen.dart';
import 'package:qpay/feature/account/particular_account_screen.dart';
import 'package:qpay/feature/account/public_account_screen.dart';

import '../../core/design/animator_route.dart';
import '../../core/design/color.dart';
import '../../core/design/common/widgets/auth_title.dart';
import '../../core/design/common/widgets/line.dart';
import '../../core/design/common/widgets/link_text.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/common/widgets/tile_container.dart';
import '../../core/design/spacing.dart';
import '../language/widgets/select_language_tile.dart';

class TypeOfAccount extends ConsumerWidget {
  const TypeOfAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountType = ref.watch(accountTypeProvider);

    void showTypeOfAccount() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: background,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Subtitle(
                    text: AppLocalizations.of(context)!.account_type,
                    color: black,
                    fontWeight: FontWeight.bold,
                    padding: 0,
                  ),
                  dense: true,
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      size: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: medium,
                    right: medium,
                    top: medium,
                    bottom: medium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Qpay se distingue par sa flexibilité en proposant trois types de comptes : Corporate, Particulier et Public. Chacun d'eux est conçu pour répondre aux exigences et aux besoins spécifiques de chaque utilisateur.",
                      ),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!.corporate,
                        color: primary,
                        fontWeight: FontWeight.bold,
                        padding: 0,
                      ),
                      const SizedBox(height: medium),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has"),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!.particular,
                        color: primary,
                        fontWeight: FontWeight.bold,
                        padding: 0,
                      ),
                      const SizedBox(height: medium),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has"),
                      const SizedBox(height: medium),
                      Subtitle(
                        text: AppLocalizations.of(context)!.public,
                        color: primary,
                        fontWeight: FontWeight.bold,
                        padding: 0,
                      ),
                      const SizedBox(height: medium),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has"),
                      const SizedBox(height: medium),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      // TODO: change checkbox
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.go,
          onTap: () {
            if (accountType == AccountType.PUBLIC)
              Navigator.push(
                context,
                animateRoute(
                  PublicAccountScreen(),
                ),
              );
            if (accountType == AccountType.PARTICULAR)
              Navigator.push(
                context,
                animateRoute(
                  ParticularAccountScreen(),
                ),
              );
            if (accountType == AccountType.CORPORATE)
              Navigator.push(
                context,
                animateRoute(
                  CorporateAccountScreen(),
                ),
              );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: extraLarge),
            AuthTitle(title: AppLocalizations.of(context)!.account_type),
            const SizedBox(height: middleSmall),
            Subtitle(
              text: AppLocalizations.of(context)!.text_account_type,
            ),
            const SizedBox(
              height: middleSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: TileContainer(
                child: Column(
                  children: [
                    SelectLanguageTile(
                      title: AppLocalizations.of(context)!.public,
                      active: accountType == AccountType.PUBLIC,
                      onTap: () {
                        ref
                            .read(accountTypeProvider.notifier)
                            .update((_) => AccountType.PUBLIC);
                      },
                    ),
                    const Line(),
                    SelectLanguageTile(
                      title: AppLocalizations.of(context)!.particular,
                      active: accountType == AccountType.PARTICULAR,
                      onTap: () {
                        ref
                            .read(accountTypeProvider.notifier)
                            .update((_) => AccountType.PARTICULAR);
                      },
                    ),
                    const Line(),
                    SelectLanguageTile(
                      title: AppLocalizations.of(context)!.corporate,
                      active: accountType == AccountType.CORPORATE,
                      onTap: () {
                        ref
                            .read(accountTypeProvider.notifier)
                            .update((_) => AccountType.CORPORATE);
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: medium),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: LinkText(
                text: AppLocalizations.of(context)!.find_out_more,
                onTap: showTypeOfAccount,
              ),
            ),
            const SizedBox(height: medium),
          ],
        ),
      ),
    );
  }
}

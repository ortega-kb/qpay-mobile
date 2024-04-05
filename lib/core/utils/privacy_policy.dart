import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../design/color.dart';
import '../design/common/widgets/link_text.dart';
import '../design/common/widgets/subtitle.dart';
import '../design/spacing.dart';
import 'constants/link.dart';
import 'launcher.dart';

void privacyPolicy(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(small),
    ),
    backgroundColor: surface,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Subtitle(
                text: AppLocalizations.of(context)!.see_policy,
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
                  Subtitle(
                    text: AppLocalizations.of(context)!.introduction,
                    padding: 0,
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: medium),
                  Text(
                    "La présente politique de confidentialité (la « Politique ») décrit comment nous, Qpay, recueillons, utilisons et partageons les informations vous concernant lorsque vous utilisez notre application mobile Qpay.",
                  ),
                  const SizedBox(height: medium),
                  Subtitle(
                    text: AppLocalizations.of(context)!.security_of_information,
                    padding: 0,
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: medium),
                  Text(
                    "Nous prenons des mesures de sécurité techniques et organisationnelles pour protéger vos informations contre l'accès non autorisé, l'utilisation ou la divulgation.",
                  ),
                  const SizedBox(height: medium),
                  Subtitle(
                    text: AppLocalizations.of(context)!.information_we_collect,
                    padding: 0,
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: medium),
                  Text(
                    "Lorsque vous utilisez l'Application, nous pouvons recueillir les informations suivantes vous concernant :",
                  ),
                  const SizedBox(
                    height: medium,
                  ),
                  Text(
                    " * Informations de compte",
                  ),
                  Text(
                    " * Informations de transaction",
                  ),
                  Text(
                    " * Autres informations",
                  ),
                  const SizedBox(height: medium),
                  Subtitle(
                    text:
                        AppLocalizations.of(context)!.how_use_your_information,
                    padding: 0,
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: medium),
                  Text("Nous utilisons vos informations pour :"),
                  const SizedBox(height: medium),
                  Text(" * Fournir et améliorer l'application"),
                  Text(" * Traiter vos transactions mobiles"),
                  Text(
                      " * Protéger notre entreprise contre la fraude et les abus"),
                  Text(" * Fournir et améliorer l'application"),
                  const SizedBox(height: medium),
                  Subtitle(
                    text: AppLocalizations.of(context)!.contact,
                    padding: 0,
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: medium),
                  Text(
                      "Si vous avez des questions sur la présente Politique, veuillez nous contacter à l'adresse suivante :"),
                  LinkText(
                    text: Link.qpayEmailContact,
                    onTap: () {
                      Launcher.linkEmail(Link.qpayEmailContact);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

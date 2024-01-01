import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/presentation/welcome/welcome_screen.dart';
import 'package:qpay/provider/language_provider.dart';

import '../../utils/color.dart';
import '../../utils/spacing.dart';
import '../../widget/common/select_language.dart';
import '../../widget/common/subtitle_text.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Séléctionner une langue",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MaterialButton(
          color: orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(large)),
          textColor: white,
          child: Padding(
            padding: const EdgeInsets.all(middleSmall),
            child: Text(
              "Continuer",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const WelcomeScreen();
              }),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: medium),
              const SubtitleText(
                  text:
                      "Sélectionnez votre langue préférée pour utiliser Qpay facilement."),
              const SizedBox(height: medium),
              Consumer<LanguageProvider>(
                builder: (context, provider, child) {
                  return SelectLanguage(
                    title: "Français / French",
                    active: provider.selected == 0,
                    onChanged: (value) {
                      provider.setLanguage(0);
                    },
                  );
                },
              ),
              const SizedBox(height: medium),
              Consumer<LanguageProvider>(
                builder: (context, provider, child) {
                  return SelectLanguage(
                    title: "Anglais / English",
                    active: provider.selected == 1,
                    onChanged: (value) {
                      provider.setLanguage(1);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

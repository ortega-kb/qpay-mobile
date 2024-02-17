import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/design/app_lang.dart';
import 'package:qpay/features/welcome/welcome_screen.dart';

import '../../core/design/animator_route.dart';
import '../../core/design/common/widgets/line.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_title.dart';
import '../../core/design/common/widgets/tile_container.dart';
import '../../core/design/spacing.dart';
import 'widgets/select_language_tile.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: MTitle(text: "select_language")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: "continue",
          onTap: () {
            Navigator.pushReplacement(context, animateRoute(WelcomeScreen()));
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          TileContainer(
            child: Column(
              children: [
                SelectLanguageTile(
                  title: "french",
                  active: ref.watch(appLangNotifierProvider.notifier) == "fr",
                  onChanged: (value) {
                    ref.read(appLangNotifierProvider).changeToFr(context);
                  },
                ),
                const Line(),
                SelectLanguageTile(
                  title: "english",
                  active: ref.watch(appLangNotifierProvider.notifier) == "en",
                  onChanged: (value) {
                    ref.read(appLangNotifierProvider).changeToEn(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

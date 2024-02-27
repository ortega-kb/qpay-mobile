import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/utils/constants/image_path.dart';
import 'package:qpay/feature/language/language_view_model.dart';
import 'package:qpay/feature/welcome/welcome_screen.dart';

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
    final language = ref.watch(languageProvider);

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
                  image: ImagePath.fr,
                  title: Language.French.name,
                  active: language.code == Language.French.code,
                  onTap: () {
                    ref
                        .read(languageProvider.notifier)
                        .update((_) => Language.French);
                  },
                ),
                const Line(),
                SelectLanguageTile(
                  image: ImagePath.us,
                  title: Language.English.name,
                  active: language.code == Language.English.code,
                  onTap: () {
                    ref
                        .read(languageProvider.notifier)
                        .update((_) => Language.English);
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

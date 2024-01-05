import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/line.dart';
import 'package:qpay/common/widgets/my_button.dart';
import 'package:qpay/common/widgets/tile_container.dart';
import 'package:qpay/features/language/language_view_model.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';

import '../../utils/spacing.dart';
import 'widgets/select_language_tile.dart';
import '../../common/widgets/subtitle.dart';
import '../../common/widgets/my_title.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyTitle(text: "select_language")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MyButton(
          text: "continue",
          onPressed: () => context.push(AppRoutes.welcome),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: medium),
              TileContainer(
                child: Column(
                  children: [
                    Consumer<LanguageViewModel>(
                      builder: (context, viewModel, child) {
                        return SelectLanguageTile(
                          title: "french",
                          active: viewModel.selectedLanguage == 0,
                          onChanged: (value) {
                            viewModel.setLanguage(context, 0);
                          },
                        );
                      },
                    ),
                    const Line(),
                    Consumer<LanguageViewModel>(
                      builder: (context, viewModel, child) {
                        return SelectLanguageTile(
                          title: "english",
                          active: viewModel.selectedLanguage == 1,
                          onChanged: (value) {
                            viewModel.setLanguage(context, 1);
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

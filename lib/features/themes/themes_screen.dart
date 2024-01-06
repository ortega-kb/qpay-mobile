import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/features/themes/themes_view_model.dart';
import 'package:qpay/features/themes/widgets/select_theme_tile.dart';

import '../../common/widgets/line.dart';
import '../../common/widgets/tile_container.dart';
import '../../utils/spacing.dart';

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "theme"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          TileContainer(
            child: Column(
              children: [
                Consumer<ThemesViewModel>(
                  builder: (context, viewModel, child) {
                    return SelectThemeTile(
                      title: "system_theme",
                      active: viewModel.selectedTheme == ThemeMode.system,
                      onChanged: (value) => viewModel.setTheme(ThemeMode.system)
                    );
                  },
                ),
                const Line(),
                Consumer<ThemesViewModel>(
                  builder: (context, viewModel, child) {
                    return SelectThemeTile(
                      title: "light",
                      active: viewModel.selectedTheme == ThemeMode.light,
                      onChanged: (value) => viewModel.setTheme(ThemeMode.light)
                    );
                  },
                ),
                const Line(),
                Consumer<ThemesViewModel>(
                  builder: (context, viewModel, child) {
                    return SelectThemeTile(
                      title: "dark",
                      active: viewModel.selectedTheme == ThemeMode.dark,
                      onChanged: (value) => viewModel.setTheme(ThemeMode.dark)
                    );
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

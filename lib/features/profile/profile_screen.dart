import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/line.dart';
import 'package:qpay/common/widgets/my_text_button.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/common/widgets/profile.dart';
import 'package:qpay/common/widgets/tile_container.dart';
import 'package:qpay/features/profile/widgets/param_tile.dart';
import 'package:qpay/features/profile/widgets/profile_extended.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "profile"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MyTextButton(
          text: "logout",
          onPressed: () => context.go(AppRoutes.welcome),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileExtended(
                  size: 100,
                  id: "QP7878547741",
                  name: "Ortega Kabwe Mulunda",
                ),
                const SizedBox(height: large),
                TileContainer(
                  child: Column(
                    children: [
                      ParamTile(
                        icon: CupertinoIcons.qrcode,
                        title: "my_qr_code",
                        onTap: () => context.push(AppRoutes.myQrCode),
                      ),
                      const Line(),
                      ParamTile(
                        icon: CupertinoIcons.person_2_fill,
                        title: "my_beneficiary",
                        onTap: () => context.push(AppRoutes.myBeneficiary),
                      ),
                      const Line(),
                      ParamTile(
                        icon: CupertinoIcons.person_crop_circle,
                        title: "account_m",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: medium),
                TileContainer(
                  child: Column(
                    children: [
                      ParamTile(
                        icon: Icons.light_mode,
                        title: "theme",
                        onTap: () => context.push(AppRoutes.themes),
                      ),
                      const Line(),
                      ParamTile(
                        icon: Icons.language_rounded,
                        title: "languages",
                        onTap: () => context.push(AppRoutes.language),
                      ),
                      ParamTile(
                        icon: Icons.password,
                        title: "change_my_pin",
                        onTap: () => context.push(AppRoutes.changeMyPin),
                      ),
                      const Line(),
                      ParamTile(
                        icon: Icons.lock,
                        title: "change_my_passwd",
                        onTap: () => context.push(AppRoutes.changeMyPasswd),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

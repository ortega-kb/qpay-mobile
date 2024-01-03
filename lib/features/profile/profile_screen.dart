import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/my_text_button.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/common/widgets/profile.dart';
import 'package:qpay/features/profile/widgets/param_tile.dart';
import 'package:qpay/features/profile/widgets/profile_extended.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';
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
                ParamTile(
                    icon: CupertinoIcons.qrcode,
                    title: "Mon Qr code",
                    onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: CupertinoIcons.person_2_fill,
                    title: "Mes bénéficiaires",
                    onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: Icons.light_mode, title: "Thèmes", onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: Icons.password,
                    title: "Changer mon pin",
                    onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: Icons.lock,
                    title: "Changer mon mot de passe",
                    onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: Icons.language_rounded,
                    title: "Langues",
                    onTap: () {}),
                const SizedBox(height: small),
                ParamTile(
                    icon: CupertinoIcons.person_crop_circle,
                    title: "Créer un compte marchand",
                    onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

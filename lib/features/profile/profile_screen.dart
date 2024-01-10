import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/line.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
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
        title: MTitle(text: "profile"),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: large),
              TileContainer(
                child: ProfileExtended(
                  size: 70,
                  id: "QP7878547741",
                  name: "Ortega Kabwe Mulunda",
                ),
              ),
              const SizedBox(height: medium),
              Subtitle(text: "account_settings"),
              const SizedBox(height: medium),
              TileContainer(
                child: Column(
                  children: [
                    ParamTile(
                      icon: CupertinoIcons.qrcode,
                      title: "my_qr_code",
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.myQrCode,
                          arguments: "QP7878981"),
                    ),
                    const Line(),
                    ParamTile(
                      icon: CupertinoIcons.person_2_fill,
                      title: "my_beneficiary",
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.myBeneficiary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: medium),
              Subtitle(text: "settings_app"),
              const SizedBox(height: medium),
              TileContainer(
                child: Column(
                  children: [
                    ParamTile(
                      icon: Icons.light_mode,
                      title: "theme",
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.themes,
                      ),
                    ),
                    const Line(),
                    ParamTile(
                      icon: Icons.language_rounded,
                      title: "languages",
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.language,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: medium),
              Subtitle(text: "manage_account"),
              const SizedBox(height: medium),
              TileContainer(
                child: Column(
                  children: [
                    ParamTile(
                      icon: CupertinoIcons.person_crop_circle,
                      title: "account_m",
                      onTap: () {},
                    ),
                    const Line(),
                    ParamTile(
                      icon: Icons.logout,
                      title: "logout",
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.login,
                        (route) => false,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: large),
            ],
          ),
        ),
      ),
    );
  }
}

//                     ParamTile(
//                       icon: Icons.password,
//                       title: "change_my_pin",
//                       onTap: () => Navigator.pushNamed(
//                         context,
//                         AppRoutes.changeMyPin,
//                       ),
//                     ),
//                     const Line(),
//                     ParamTile(
//                       icon: Icons.lock,
//                       title: "change_my_passwd",
//                       onTap: () => Navigator.pushNamed(
//                         context,
//                         AppRoutes.changeMyPasswd,
//                       ),
//                     ),

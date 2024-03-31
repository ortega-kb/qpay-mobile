import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_store/open_store.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/common/widgets/line.dart';
import 'package:qpay/core/design/common/widgets/profile.dart';
import 'package:qpay/core/design/common/widgets/subtitle.dart';
import 'package:qpay/core/design/common/widgets/tile_container.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/utils/constants/link.dart';
import 'package:qpay/core/utils/privacy_policy.dart';
import 'package:qpay/feature/my_qr_code/my_qr_code_screen.dart';
import 'package:qpay/feature/profile/widgets/param_tile.dart';
import 'package:qpay/feature/settings/settings_screen.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: medium,
          ),
          Profile(
            size: 120,
            onTap: () {},
          ),
          const SizedBox(
            height: medium,
          ),
          Center(
            child: Subtitle(
              text: "Ortega",
              color: primary,
            ),
          ),
          const SizedBox(
            height: extraSmall,
          ),
          Center(
            child: Subtitle(
              text: "+243996875512",
            ),
          ),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: TileContainer(
              child: Column(
                children: [
                  ParamTile(
                    title: AppLocalizations.of(context)!.my_qr_code,
                    iconData: CupertinoIcons.qrcode,
                    onTap: () {
                      Navigator.push(
                        context,
                        animateRoute(
                          MyQrCodeScreen(
                            accountNumber: "QP1000000000",
                          ),
                        ),
                      );
                    },
                  ),
                  const Line(),
                  ParamTile(
                    title: AppLocalizations.of(context)!.settings,
                    iconData: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        animateRoute(
                          SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  const Line(),
                  ParamTile(
                    title: AppLocalizations.of(context)!.see_policy,
                    iconData: Icons.security,
                    onTap: () {
                      privacyPolicy(context);
                    },
                  ),
                  const Line(),
                  ParamTile(
                    title: AppLocalizations.of(context)!.rate_app,
                    iconData: CupertinoIcons.star_fill,
                    onTap: () {
                      OpenStore.instance.open(
                        androidAppBundleId: Link.androidBundleApp,
                      );
                    },
                  ),
                  const Line(),
                  ParamTile(
                    title: AppLocalizations.of(context)!.invite_friends,
                    iconData: Icons.share,
                    onTap: () {
                      Share.shareUri(Uri.parse(Link.qpayApp));
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: medium),
          Center(
            child: Text(
              "Version: 1.0.0 (1)",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Center(
            child: Text(
              "By IQGROUP",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}

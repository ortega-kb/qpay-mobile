import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:qpay/core/design/animator_route.dart';
import 'package:qpay/core/design/common/widgets/auth_title.dart';
import 'package:qpay/core/design/common/widgets/m_button.dart';
import 'package:qpay/core/design/common/widgets/subtitle.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/utils/constants/animation_path.dart';
import 'package:qpay/core/utils/constants/image_path.dart';
import 'package:qpay/feature/home/home_screen.dart';


/// Class AccountSuccessCreationScreen
/// Show success message with lottie file animation 
class AccountSuccessCreationScreen extends StatelessWidget {
  const AccountSuccessCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.go,
          onTap: () {
            Navigator.pushAndRemoveUntil(context, animateRoute(HomeScreen()), (route) => false);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: large),
            Center(child: AuthTitle(title: AppLocalizations.of(context)!.well_done,)),
            const SizedBox(height: medium),
            Center(child: Subtitle(text: AppLocalizations.of(context)!.success_created)),
            const SizedBox(height: large,),
            SvgPicture.asset(ImagePath.svgSuccess, height: 150, width: 150)
          ],
        ),
      ),
    );
  }
}
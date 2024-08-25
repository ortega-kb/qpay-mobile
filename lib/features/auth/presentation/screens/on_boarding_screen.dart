import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_outlined_button.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/image_path.dart';
import 'package:qpay/features/auth/presentation/widgets/on_boarding_image.dart';
import 'package:qpay/features/auth/presentation/widgets/on_boarding_page.dart';

import '../../../../core/theme/app_dimen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OnBoardingSlider(
        addButton: false,
        controllerColor: AppColor.primary,
        totalPage: 3,
        headerBackgroundColor: AppColor.surface,
        finishButtonText: AppLocalizations.of(context)!.get_started,
        background: [
          OnBoardingImage(imagePath: ImagePath.svgTransfer),
          OnBoardingImage(imagePath: ImagePath.svgQrCode),
          OnBoardingImage(imagePath: ImagePath.svgPaymentReceive),
        ],
        speed: 1.8,
        centerBackground: true,
        addController: true,
        hasFloatingButton: false,
        hasSkip: false,
        pageBodies: [
          OnBoardingPage(
            title: AppLocalizations.of(context)!.transfer_money,
            text: AppLocalizations.of(context)!.text_transfer_money,
          ),
          OnBoardingPage(
            title: AppLocalizations.of(context)!.qr_payment,
            text: AppLocalizations.of(context)!.text_qr_payment,
          ),
          OnBoardingPage(
            title: AppLocalizations.of(context)!.receive_payment,
            text: AppLocalizations.of(context)!.text_receive_payment,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimen.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            MButton(
              text: AppLocalizations.of(context)!.login,
              onPressed: () => context.push('/sign-in'),
            ),
            const SizedBox(height: AppDimen.p8),
            MOutlinedButton(
              text: AppLocalizations.of(context)!.create_account,
              onPressed: () => context.push('/sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}

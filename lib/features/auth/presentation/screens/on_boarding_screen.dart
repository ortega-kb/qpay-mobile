import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/image_path.dart';
import 'package:qpay/features/auth/presentation/widgets/on_boarding_image.dart';
import 'package:qpay/features/auth/presentation/widgets/on_boarding_page.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OnBoardingSlider(
        controllerColor: AppColor.primary,
        onFinish: () {
          context.push('/sign-in');
        },
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
    );
  }
}

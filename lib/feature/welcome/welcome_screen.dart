import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/page_indicator_provider.dart';
import 'package:qpay/feature/login/login_screen.dart';
import 'package:qpay/feature/welcome/widgets/page_indicator/page_indicator.dart';
import 'package:qpay/feature/welcome/widgets/page_item.dart';

import '../../core/design/animator_route.dart';
import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/spacing.dart';
import '../../core/utils/constants/image_path.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageIndicatorProvider);
    var pageController = PageController(initialPage: currentPage);

    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(
        backgroundColor: surface,
        surfaceTintColor: surface,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.get_started,
          onTap: () {
            Navigator.pushReplacement(context, animateRoute(LoginScreen()));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: large),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  PageItem(
                    image: ImagePath.svgTransfer,
                    title: AppLocalizations.of(context)!.transfer_money,
                    subtitle: AppLocalizations.of(context)!.text_transfer_money,
                  ),
                  PageItem(
                    image: ImagePath.svgQrCode,
                    title: AppLocalizations.of(context)!.qr_payment,
                    subtitle: AppLocalizations.of(context)!.text_qr_payment,
                  ),
                  PageItem(
                    image: ImagePath.svgPaymentReceive,
                    title: AppLocalizations.of(context)!.receive_payment,
                    subtitle:
                        AppLocalizations.of(context)!.text_receive_payment,
                  )
                ],
                onPageChanged: (value) {
                  ref.read(pageIndicatorProvider.notifier).update((_) => value);
                },
              ),
            ),
            PageIndicator(page: ref.watch(pageIndicatorProvider))
          ],
        ),
      ),
    );
  }
}

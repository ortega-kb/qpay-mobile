import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/features/welcome/widgets/page_indicator/page_indicator.dart';
import 'package:qpay/features/welcome/widgets/page_indicator/page_indicator_provider.dart';
import 'package:qpay/features/welcome/widgets/page_item.dart';
import 'package:qpay/utils/constants/image_path.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/spacing.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialPage = ref.watch(pageIndicatorProvider);
    var pageController = PageController(initialPage: initialPage);

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
          text: "get_started",
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: large),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  PageItem(
                    image: ImagePath.svgTransfer,
                    title: "transfer_money",
                    subtitle: "subtitle_transfer_money",
                  ),
                  PageItem(
                    image: ImagePath.svgQrCode,
                    title: "qr_code_payment",
                    subtitle: "subtitle_qr_code_payment",
                  ),
                  PageItem(
                    image: ImagePath.svgPaymentReceive,
                    title: "receive_payment",
                    subtitle: "subtitle_receive_payment",
                  )
                ],
                onPageChanged: (value) {
                  ref.read(pageIndicatorProvider.notifier).setPage(value);
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

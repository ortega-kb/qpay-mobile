import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_button.dart';
import 'package:qpay/features/welcome/widgets/page_indicator.dart';
import 'package:qpay/features/welcome/widgets/page_item.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/constants/image_path.dart';
import 'package:qpay/utils/spacing.dart';

import '../../providers/welcome_page_provider.dart';
import '../../utils/color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initialPage = Provider.of<WelcomePageProvider>(context).selectedPage;
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
          onTap: () => Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: large),
            Expanded(
              child: Consumer<WelcomePageProvider>(
                builder: (context, provider, child) {
                  return PageView(
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
                      provider.setPage(value);
                    },
                  );
                },
              ),
            ),
            Consumer<WelcomePageProvider>(
              builder: (context, provider, child) {
                return PageIndicator(page: provider.selectedPage);
              },
            )
          ],
        ),
      ),
    );
  }
}

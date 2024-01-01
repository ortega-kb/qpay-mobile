import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/my_button.dart';
import 'package:qpay/features/welcome/welcome_view_model.dart';
import 'package:qpay/features/welcome/widgets/page_item.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/constants/image_path.dart';
import 'package:qpay/utils/spacing.dart';
import 'package:qpay/features/welcome/widgets/page_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initialPage = Provider.of<WelcomeViewModel>(context).selectedPage;
    var pageController = PageController(initialPage: initialPage);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.light_mode,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MyButton(
          text: "get_started",
          onPressed: () => context.push(AppRoutes.main),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: large),
            Expanded(
              child: Consumer<WelcomeViewModel>(
                builder: (context, viewModel, child) {
                  return PageView(
                    controller: pageController,
                    children: const [
                      PageItem(
                        image: ImagePath.transfer,
                        title: "transfer_money",
                        subtitle: "subtitle_transfer_money",
                      ),
                      PageItem(
                        image: ImagePath.qrCode,
                        title: "qr_code_payment",
                        subtitle: "subtitle_qr_code_payment",
                      ),
                      PageItem(
                        image: ImagePath.paymentReceive,
                        title: "receive_payment",
                        subtitle: "subtitle_receive_payment",
                      )
                    ],
                    onPageChanged: (value) {
                      viewModel.setPage(value);
                    },
                  );
                },
              ),
            ),
            Consumer<WelcomeViewModel>(
              builder: (context, viewModel, child) {
                return PageIndicator(page: viewModel.selectedPage);
              },
            )
          ],
        ),
      ),
    );
  }
}

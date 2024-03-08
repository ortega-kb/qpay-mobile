import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/provider/corporate_account_provider.dart';
import 'package:qpay/feature/account/widget/header_corporate_account.dart';

import '../../core/design/animator_route.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/spacing.dart';
import '../upload_picture/upload_picture_screen.dart';

class CorporateAccountScreen extends ConsumerStatefulWidget {
  const CorporateAccountScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<CorporateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var currentPage = ref.watch(corporateAccountProvider);
    var pageController = PageController(initialPage: currentPage);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            if (pageController.page?.round() == 0) {
              Navigator.pop(context);
            } else {
              pageController.previousPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.go,
          onTap: () {
            if (pageController.page?.round() == 2) {
              Navigator.push(
                context,
                animateRoute(
                  UploadPictureScreen(),
                ),
              );
            } else {
              pageController.nextPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          // first form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderCorporateAccount(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // second form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderCorporateAccount(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // third form
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderCorporateAccount(),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        onPageChanged: (value) {
          ref.read(corporateAccountProvider.notifier).update((_) => value);
        },
      ),
    );
  }
}

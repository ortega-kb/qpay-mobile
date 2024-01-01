import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qpay/provider/welcome_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';
import 'package:qpay/widget/welcome/page_indicator.dart';
import 'package:qpay/widget/welcome/page_item.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final initialPage = Provider.of<WelcomeProvider>(context).currentPage;
    var pageController = PageController(initialPage: initialPage);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer<WelcomeProvider>(
            builder: (context, provider, child) {
              return IconButton(
                onPressed: () {
                  provider.setTheme(!provider.darkTheme);
                },
                icon: Icon(
                  provider.darkTheme ? Icons.light_mode : Icons.dark_mode,
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MaterialButton(
          color: orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(large)),
          textColor: white,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(middleSmall),
            child: Text(
              "Commencer",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: large),
            Expanded(
              child: Consumer(
                builder: (context, provider, child) {
                  return PageView(
                    controller: pageController,
                    children: const [
                      PageItem(
                          image: "assets/images/transfert.png",
                          title: "Transférer de l'argent",
                          subtitle:
                              "Facilitez le transfert d'argent vers un compte abonné et approvisionnez aisément tous vos comptes variés avec simplicité."),
                      PageItem(
                          image: "assets/images/qr-code.png",
                          title: "Payement par QR code",
                          subtitle:
                              "Effectuez rapidement et facilement des paiements en scannant simplement le QR code, grâce à cette méthode pratique et sécurisée."),
                      PageItem(
                          image: "assets/images/payement-receive.png",
                          title: "Récevoir un payement",
                          subtitle:
                              "Générez facilement des factures en ajoutant toutes les informations nécessaires, puis créez un QR code pour permettre un paiement rapide et pratique."),
                    ],
                    onPageChanged: (value) {
                      provider.setPage(value);
                    },
                  );
                },
              ),
            ),
            Consumer(
              builder: (context, provider, child) {
                return PageIndicator(page: provider.currentPage);
              },
            )
          ],
        ),
      ),
    );
  }
}

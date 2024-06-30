import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/currency.dart';

import '../../theme/app_color.dart';
import '../../theme/app_dimen.dart';

class WalletUSDCDF extends StatefulWidget {
  const WalletUSDCDF({super.key});

  @override
  State<WalletUSDCDF> createState() => _WalletUSDCDFState();
}

class _WalletUSDCDFState extends State<WalletUSDCDF> {
  int currentPage = 0;
  var pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: pageController,
            children: [
              Wallet(
                title: AppLocalizations.of(context)!.wallet_cap,
                onTap: () => context.push('/wallet-list'),
                walletIndicator: WalletIndicator(index: currentPage),
                currency: Currency.CDF,
              ),
              Wallet(
                title: AppLocalizations.of(context)!.wallet_cap,
                onTap: () => context.push('/wallet-list'),
                walletIndicator: WalletIndicator(index: currentPage),
                currency: Currency.USD,
              ),
            ],
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
        ),
      ],
    );
  }
}

// WalletIndicator [index]
class WalletIndicator extends StatefulWidget {
  final int index;

  const WalletIndicator({super.key, required this.index});

  @override
  State<WalletIndicator> createState() => _WalletIndicatorState();
}

class _WalletIndicatorState extends State<WalletIndicator> {
  @override
  Widget build(BuildContext context) {
    print("Current index: ${widget.index}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          active: widget.index == 0,
          activeColor: AppColor.white,
          inactiveColor: AppColor.gray,
        ),
        const SizedBox(width: AppDimen.p4),
        Indicator(
          active: widget.index == 1,
          activeColor: AppColor.white,
          inactiveColor: AppColor.gray,
        )
      ],
    );
  }
}

// Wallet [title, onTap, onDelete]
class Wallet extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final void Function()? onDelete;
  final Currency currency;
  final Widget walletIndicator;

  const Wallet({
    super.key,
    this.onTap,
    this.onDelete,
    required this.title,
    required this.currency,
    required this.walletIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimen.p12, right: AppDimen.p12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(AppDimen.p16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    InkWell(
                      onTap: onTap ?? onDelete,
                      child: Icon(
                        onTap == null
                            ? FluentIcons.delete_dismiss_24_filled
                            : Icons.arrow_forward,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: false,
                title: Text(
                  AppLocalizations.of(context)!.total_balance,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.white.withOpacity(0.7),
                  ),
                ),
                subtitle: Text(
                  currency == Currency.CDF ? AppLocalizations.of(context)!.cdf("50.00"): AppLocalizations.of(context)!.usd("50.00"),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: walletIndicator,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Indicator
class Indicator extends StatelessWidget {
  final bool active;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const Indicator({
    super.key,
    this.size = 8.5,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: active ? size * 3 : size,
      height: size,
      curve: Curves.easeInOutBack,
      decoration: BoxDecoration(
          color: active ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(size / 2)),
      duration: Duration(milliseconds: 500),
    );
  }
}

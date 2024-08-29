import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/currency.dart';
import 'package:qpay/features/dashboard/presentation/bloc/cubits/wallet_page_cubit.dart';

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
      initialPage: context.read<WalletPageCubit>().state,
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
        AspectRatio(
          aspectRatio: 16.0 / 8.5,
          child: SizedBox(
            child: BlocBuilder<WalletPageCubit, int>(
              builder: (context, state) {
                return PageView(
                  controller: pageController,
                  children: [
                    Wallet(
                      title: AppLocalizations.of(context)!.wallet_cap,
                      onTap: () => context.push('/wallet-list'),
                      walletIndicator: WalletIndicator(
                        index: state,
                      ),
                      currency: Currency.CDF,
                    ),
                    Wallet(
                      title: AppLocalizations.of(context)!.wallet_cap,
                      onTap: () => context.push('/wallet-list'),
                      walletIndicator: WalletIndicator(
                        index: state,
                      ),
                      currency: Currency.USD,
                    ),
                  ],
                  onPageChanged: (page) {
                    context.read<WalletPageCubit>().onChangePage(page);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// WalletIndicator [index]
class WalletIndicator extends StatelessWidget {
  final int index;
  const WalletIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    debugPrint('Wallet indicator: $index');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          active: index == 0,
          activeColor: AppColor.white,
          inactiveColor: AppColor.white,
        ),
        const SizedBox(width: AppDimen.p8),
        Indicator(
          active: index == 1,
          activeColor: AppColor.white,
          inactiveColor: AppColor.white,
        )
      ],
    );
  }
}

/// Wallet [title, onTap, onDelete]
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
        onTap: null,
        child: AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primary,
              gradient: LinearGradient(
                colors: [
                  AppColor.dark,
                  AppColor.greenIntermediate,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimen.p32),
            ),
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
                        onTap: null,
                        child: Tooltip(
                          message: AppLocalizations.of(context)!.reload,
                          child: Icon(
                            FluentIcons.arrow_rotate_clockwise_24_filled,
                            color: AppColor.white,
                          ),
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
                    currency == Currency.CDF
                        ? AppLocalizations.of(context)!.cdf("1500.00")
                        : AppLocalizations.of(context)!.usd("10.00"),
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
      width: active ? size * 4.5 : size,
      height: size,
      curve: Curves.easeInOutBack,
      decoration: BoxDecoration(
          color: active ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(size / 2)),
      duration: Duration(milliseconds: 500),
    );
  }
}

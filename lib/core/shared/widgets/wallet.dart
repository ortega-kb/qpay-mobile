import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/shared/cubits/wallet_show_hide_cubit.dart';
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
                    WalletPage(
                      title: AppLocalizations.of(context)!.wallet_cap,
                      onTap: () => context.push('/wallet-list'),
                      walletIndicator: WalletIndicator(
                        index: state,
                      ),
                      currency: Currency.CDF,
                    ),
                    WalletPage(
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
class WalletPage extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final void Function()? onDelete;
  final Currency currency;
  final Widget walletIndicator;

  const WalletPage({
    super.key,
    this.onTap,
    this.onDelete,
    required this.title,
    required this.currency,
    required this.walletIndicator,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Define padding and aspect ratio based on screen width
    final double padding = screenWidth > 600 ? 24.0 : 12.0;
    final double aspectRatio = screenWidth > 600 ? 4 / 3 : 16 / 9;
    final TextStyle titleStyle = screenWidth > 600
        ? Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            )
        : Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            );

    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: InkWell(
        onTap: null,
        child: AspectRatio(
          aspectRatio: aspectRatio,
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
                  padding: EdgeInsets.all(AppDimen.p16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: titleStyle,
                      ),
                      Row(
                        children: [
                          BlocBuilder<WalletShowHideCubit, bool>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<WalletShowHideCubit>()
                                      .toggleWalletVisibility();
                                },
                                child: Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .show_hide_wallet_amount,
                                  child: Padding(
                                    padding: const EdgeInsets.all(AppDimen.p2),
                                    child: Icon(
                                      state
                                          ? FluentIcons.eye_off_24_filled
                                          : FluentIcons.eye_24_filled,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                        ],
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
                  subtitle: BlocBuilder<WalletShowHideCubit, bool>(
                    builder: (context, state) {
                      return ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: state ? 0: 13, sigmaY: state ? 0: 13),
                        child: Text(
                          currency == Currency.CDF
                              ? AppLocalizations.of(context)!.cdf("0.00")
                              : AppLocalizations.of(context)!.usd("0.00"),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppDimen.p16),
                  child: walletIndicator,
                ),
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

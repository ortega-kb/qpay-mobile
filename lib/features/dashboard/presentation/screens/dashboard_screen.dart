import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qpay/config/app_route_name.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_select_fied.dart';
import 'package:qpay/core/shared/widgets/m_subtitle.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/shared/widgets/title_section.dart';
import 'package:qpay/core/shared/widgets/list_loader.dart';
import 'package:qpay/core/shared/widgets/wallet.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/currency.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/validator.dart';
import 'package:qpay/features/dashboard/presentation/widgets/quick_action_list.dart';
import 'package:qpay/di/dependencies.dart';
import 'package:qpay/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../qr_code/presentation/screens/qr_scanner_screen.dart';
import '../../../wallet/presentation/bloc/wallet_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _walletTypeController = TextEditingController();

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
    generateLinkPayment() {
      return WoltModalSheet.show(
        context: context,
        useSafeArea: true,
        onModalDismissedWithDrag: () => _formKey.currentState!.reset(),
        pageListBuilder: (context) {
          return [
            WoltModalSheetPage(
              topBarTitle: Text(
                AppLocalizations.of(context)!.payment_link,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              isTopBarLayerAlwaysVisible: true,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimen.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MSubtitle(
                        title: AppLocalizations.of(context)!
                            .enter_information_link_payment,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _descriptionController,
                        label: AppLocalizations.of(context)!.description,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _amountController,
                        label: AppLocalizations.of(context)!.amount,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MSelectField(
                        selectEditingController: _walletTypeController,
                        initialValue: null,
                        label: AppLocalizations.of(context)!.currency,
                        items: [
                          {
                            'value': Currency.CDF.value,
                            'label': Currency.CDF.value,
                            'textStyle': TextStyle(
                              color: AppColor.gray,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontSize,
                            )
                          },
                          {
                            'value': Currency.USD.value,
                            'label': Currency.USD.value,
                            'textStyle': TextStyle(
                              color: AppColor.gray,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontSize,
                            ),
                          },
                        ],
                      ),
                      const SizedBox(height: AppDimen.p32),
                      MButton(
                        text: AppLocalizations.of(context)!.generate_link,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final link = LinkUtil.paymentLinkGenerator(
                              userCode:
                                  locator<UserInformationService>().userCode,
                              amount: _amountController.text.trim(),
                              description: _descriptionController.text.trim(),
                              wallet: _walletTypeController.text,
                            );

                            Share.shareUri(link);
                          }
                        },
                      ),
                      const SizedBox(height: AppDimen.p16)
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.greeting,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColor.gray),
            ),
            Text(
              locator<UserInformationService>().username,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.qr_scanner,
            onPressed: () async {
              PermissionStatus status = await Permission.camera.status;
              if (status == PermissionStatus.granted) {
                // Open QR Scanner
                context.push(QrScannerScreen.route);
              } else if (status.isDenied || status.isPermanentlyDenied) {
                // Request permission
                await Permission.camera.request();
                if (await Permission.camera.isGranted) {
                  // If permission granted, open QR Scanner
                  context.push(QrScannerScreen.route);
                } else {
                  Messages.error(
                    AppLocalizations.of(context)!.permission,
                    AppLocalizations.of(context)!.access_permission,
                    context,
                  );
                }
              }
            },
            icon: Icon(FluentIcons.scan_dash_24_filled),
          ),
          const SizedBox(
            width: AppDimen.p0,
          ),
          IconButton(
            tooltip: AppLocalizations.of(context)!.notifications,
            onPressed: () {
              context.push(NotificationsScreen.route);
            },
            icon: Badge.count(
              count: 3,
              child: Icon(FluentIcons.alert_24_filled),
            ),
          ),
          const SizedBox(
            width: AppDimen.p8,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<WalletBloc>().add(
                WalletGetByUserCodeEvent(
                  userCode: locator<UserInformationService>().userCode,
                ),
              );
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimen.p16),
              WalletUSDCDF(),
              const SizedBox(height: AppDimen.p4),
              TitleSection(
                  title: AppLocalizations.of(context)!.quick_operation),
              const SizedBox(height: AppDimen.p4),
              QuickActionList(
                  onGenerateLinkPayment: () => generateLinkPayment()),
              const SizedBox(height: AppDimen.p4),
              TitleSection(
                  title: AppLocalizations.of(context)!.recent_transactions,
                  actionTitle: AppLocalizations.of(context)!.see_more,
                  onClickAction: () {}),
              const SizedBox(height: AppDimen.p4),
              ListLoader(itemCount: 4, enabled: false)
            ],
          ),
        ),
      ),
    );
  }
}

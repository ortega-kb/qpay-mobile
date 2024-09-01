import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/shared/widgets/m_subtitle.dart';
import 'package:qpay/core/shared/widgets/m_text_field.dart';
import 'package:qpay/core/shared/widgets/not_found.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/recognize_provider.dart';
import 'package:qpay/core/utils/validator.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/presentation/widgets/wallet_tile.dart';
import 'package:qpay/init_dependencies.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../core/utils/image_path.dart';

class WalletListScreen extends StatefulWidget {
  const WalletListScreen({super.key});

  @override
  State<WalletListScreen> createState() => _WalletListScreenState();
}

class _WalletListScreenState extends State<WalletListScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();

  List<Wallet> wallets = [];

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    addWallet() {
      return WoltModalSheet.show(
        context: context,
        useSafeArea: true,
        pageListBuilder: (context) {
          return [
            WoltModalSheetPage(
              topBarTitle: Text(
                AppLocalizations.of(context)!.add_wallet,
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
                            .enter_correct_mobile_money,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _phoneController,
                        label: AppLocalizations.of(context)!.phone_number,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return Validator.phoneValidator(value);
                        },
                        prefixIcon: Column(
                          children: [
                            Text(
                              "🇨🇩 +243 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColor.gray),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _pinController,
                        label: AppLocalizations.of(context)!.pin,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // 4 length of pin providers
                          LengthLimitingTextInputFormatter(4),
                        ],
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MButton(
                        text: AppLocalizations.of(context)!.add,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final phone = _phoneController.text.trim();
                            wallets.add(
                              Wallet(
                                userId:
                                    locator<UserInformationService>().userId,
                                userCode:
                                    locator<UserInformationService>().userCode,
                                walletPin: _pinController.text.trim(),
                                providerType:
                                    RecognizeProvider.recognize(phone)!,
                                walletPhone: phone,
                              ),
                            );

                            // setState(() {});
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
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
        title: Text(AppLocalizations.of(context)!.my_wallets),
        actions: [
          IconButton(
            onPressed: () {
              addWallet();
            },
            icon: Icon(FluentIcons.add_circle_24_filled),
            tooltip: AppLocalizations.of(context)!.add_wallet,
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
      body: NotFound(
        image: ImagePath.emptyBro,
        message: AppLocalizations.of(context)!.wallets_not_found,
      ),
    );
  }
}

/*
ListView.separated(
        padding: EdgeInsets.symmetric(vertical: AppDimen.p16),
        itemBuilder: (context, index) => WalletTile(wallet: wallets[index]),
        separatorBuilder: (context, index) => Separator(),
        itemCount: wallets.length,
      ),
*/

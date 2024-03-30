import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/spacing.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_button.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';
import '../../core/design/validator.dart';

class WalletsScreen extends ConsumerStatefulWidget {
  const WalletsScreen({super.key});

  @override
  ConsumerState createState() => _WalletsScreenState();
}

class _WalletsScreenState extends ConsumerState<WalletsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addWallet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: background,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Subtitle(
                      text: AppLocalizations.of(context)!.add_wallet,
                      color: black,
                      fontWeight: FontWeight.bold,
                      padding: 0,
                    ),
                    dense: true,
                    trailing: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.xmark,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: medium,
                      right: medium,
                      top: medium,
                      bottom: medium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: medium),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: medium,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MTextField(
                                  controller: _phoneController,
                                  label: AppLocalizations.of(context)!
                                      .phone_number,
                                  prefixIcon: Column(
                                    children: [
                                      Text(
                                        "🇨🇩 +243 ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: gray),
                                      )
                                    ],
                                  ),
                                  obscureText: false,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    return Validator.phoneValidator(value!);
                                  },
                                ),
                                const SizedBox(height: medium),
                                MButton(
                                  text: AppLocalizations.of(context)!.add,
                                  onTap: () {},
                                ),
                                const SizedBox(height: medium),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_wallets),
        actions: [
          IconButton(
            onPressed: addWallet,
            icon: Icon(
              Icons.add,
            ),
          ),
          const SizedBox(width: medium)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: medium),
          ],
        ),
      ),
    );
  }
}

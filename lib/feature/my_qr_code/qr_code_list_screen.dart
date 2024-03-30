import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/common/widgets/m_button.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/design/validator.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';

class QrCodeListScreen extends ConsumerStatefulWidget {
  const QrCodeListScreen({super.key});

  @override
  ConsumerState createState() => _QrCodeListScreenState();
}

class _QrCodeListScreenState extends ConsumerState<QrCodeListScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addUpdateQrCode() {
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
                      text: AppLocalizations.of(context)!.add,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: medium),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MTextField(
                                  controller: _titleController,
                                  label: AppLocalizations.of(context)!.motif,
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    return Validator.allValidator(value);
                                  },
                                ),
                                const SizedBox(height: medium),
                                MTextField(
                                  controller: _priceController,
                                  label: AppLocalizations.of(context)!.price,
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    return Validator.allValidator(value);
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
        title: Text(AppLocalizations.of(context)!.my_qr_codes),
        actions: [
          IconButton(onPressed: addUpdateQrCode, icon: Icon(Icons.add)),
          const SizedBox(width: medium)
        ],
      ),
    );
  }
}

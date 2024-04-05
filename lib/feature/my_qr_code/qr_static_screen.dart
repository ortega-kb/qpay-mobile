import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/common/widgets/m_button.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/design/validator.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';
import 'package:qpay/core/utils/enums/currency.dart';
import 'package:qpay/feature/my_qr_code/qr_static_view_model.dart';
import 'package:qpay/feature/my_qr_code/widgets/qr_static_tile.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/m_select_fied.dart';
import '../../core/design/common/widgets/m_text_field.dart';
import '../../core/design/common/widgets/subtitle.dart';

class QRStaticScreen extends ConsumerStatefulWidget {
  const QRStaticScreen({super.key});

  @override
  ConsumerState createState() => _QrCodeListScreenState();
}

class _QrCodeListScreenState extends ConsumerState<QRStaticScreen> {
  final _formKey = GlobalKey<FormState>();
  final _motifController = TextEditingController();
  final _priceController = TextEditingController();
  final _currencyController = TextEditingController();

  @override
  void dispose() {
    _motifController.dispose();
    _priceController.dispose();
    _currencyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<QRStatic> qrStaticList =
        ref.watch(qrStaticViewModelProvider).qrStatic;
    final isLoading = ref.watch(qrStaticViewModelProvider).isLoading;

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
                                  controller: _motifController,
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
                                MSelectField(
                                  selectEditingController: _currencyController,
                                  initialValue: null,
                                  label: AppLocalizations.of(context)!.currency,
                                  items: [
                                    {
                                      'value': Currency.CDF.value,
                                      'label': Currency.CDF.value,
                                      'textStyle': TextStyle(
                                        color: gray,
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
                                        color: gray,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize,
                                      ),
                                    },
                                  ],
                                ),
                                const SizedBox(height: medium),
                                MButton(
                                  text: AppLocalizations.of(context)!.add,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      QRStatic qrStatic = QRStatic(
                                          account: "QP7878984152",
                                          amount: double.parse(
                                              _priceController.text.trim()),
                                          motif: _motifController.text.trim(),
                                          currency:
                                              _currencyController.text.trim());
                                      ref
                                          .read(qrStaticViewModelProvider
                                              .notifier)
                                          .addQRStatic(qrStatic);

                                      ref
                                          .read(qrStaticViewModelProvider
                                              .notifier)
                                          .getAllQRStatic();

                                      Navigator.pop(context);
                                    }
                                  },
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: qrStaticList.length,
              padding: EdgeInsets.only(bottom: 80),
              shrinkWrap: false,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: medium),
                  child: QRStaticTile(
                    qrStatic: qrStaticList[index],
                    onDelete: () {},
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}

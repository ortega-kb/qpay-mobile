
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/list_loader.dart';
import 'package:qpay/core/shared/widgets/m_subtitle.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/features/qr_code/presentation/widgets/qr_static_list.dart';
import 'package:qpay/di/dependencies.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/shared/widgets/m_button.dart';
import '../../../../core/shared/widgets/m_select_fied.dart';
import '../../../../core/shared/widgets/m_text_field.dart';
import '../../../../core/utils/currency.dart';
import '../../../../core/utils/validator.dart';
import '../bloc/qr_code_bloc.dart';

class QrCodeStaticScreen extends StatefulWidget {
  const QrCodeStaticScreen({super.key});

  @override
  State<QrCodeStaticScreen> createState() => _QrCodeStaticScreenState();
}

class _QrCodeStaticScreenState extends State<QrCodeStaticScreen> {
  final _formKey = GlobalKey<FormState>();
  final _motifController = TextEditingController();
  final _amountController = TextEditingController();
  final _currencyController = TextEditingController();

  @override
  void initState() {
    context.read<QRCodeBloc>().add(GetAllQRStatic());
    super.initState();
  }

  @override
  void dispose() {
    _motifController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    addQRCode() {
      return WoltModalSheet.show(
        context: context,
        useSafeArea: true,
        pageListBuilder: (context) {
          return [
            WoltModalSheetPage(
              topBarTitle: Text(
                AppLocalizations.of(context)!.add_qr_code,
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
                        title:
                            AppLocalizations.of(context)!.validate_informations,
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _motifController,
                        label: AppLocalizations.of(context)!.motif,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MTextField(
                        controller: _amountController,
                        label: AppLocalizations.of(context)!.price,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return Validator.allValidator(value);
                        },
                      ),
                      const SizedBox(height: AppDimen.p16),
                      MSelectField(
                        selectEditingController: _currencyController,
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
                        text: AppLocalizations.of(context)!.generate_qr_code,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<QRCodeBloc>().add(
                                  AddQRStaticEvent(
                                    sl<UserInformationService>().userCode,
                                    double.parse(_amountController.text),
                                    _motifController.text.trim(),
                                    _currencyController.text.trim(),
                                  ),
                                );

                            _formKey.currentState!.reset();
                            Navigator.of(context).pop();

                            context.read<QRCodeBloc>().add(GetAllQRStatic());
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

    void confirmDeleteQRStatic(int index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.p16),
            ),
            title: Text(AppLocalizations.of(context)!.delete),
            content: Text(AppLocalizations.of(context)!.confirm_delete),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<QRCodeBloc>().add(DeleteQRStaticEvent(index));
                  context.read<QRCodeBloc>().add(GetAllQRStatic());
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_qr_codes),
        actions: [
          IconButton(
            onPressed: () {
              addQRCode();
            },
            tooltip: AppLocalizations.of(context)!.add_qr_code,
            icon: Icon(FluentIcons.add_circle_24_filled),
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
      body: BlocConsumer<QRCodeBloc, QRCodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is QRStaticLoadingState)
            return ListLoader(itemCount: 5);
          else if (state is QRStaticLoadedState)
            return QrStaticList(
              qrStatics: state.qrStatics,
              onDeleteQrStatic: (index) {
                confirmDeleteQRStatic(index);
              },
            );
          else
            return const SizedBox.shrink();
        },
      ),
    );
  }
}

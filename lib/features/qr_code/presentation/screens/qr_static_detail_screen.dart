import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qpay/core/shared/widgets/qr_code_view.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/enums/operation_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/utils/qr_response.dart';
import '../../domain/entities/qr_static.dart';

class QRStaticDetailScreen extends StatefulWidget {
  final QRStatic qrStatic;

  const QRStaticDetailScreen({super.key, required this.qrStatic});

  static String path = 'qr-static-details';
  static String route = '/qr-static-details';

  @override
  State<QRStaticDetailScreen> createState() => _QRStaticDetailScreenState();
}

class _QRStaticDetailScreenState extends State<QRStaticDetailScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  late TransactionResponse _qrResponse;

  initialize() {
    _qrResponse = TransactionResponse(
        code: widget.qrStatic.account,
        amount: widget.qrStatic.amount,
        type: OperationType.PAYMENT.name,
        wallet: widget.qrStatic.currency,
        description: widget.qrStatic.motif);
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _takeScreenshot() async {
    final image = await screenshotController.capture();
    if (image != null) {
      await ImageGallerySaver.saveImage(image, name: 'qpay_qr_static.png');
      Messages.success(
        AppLocalizations.of(context)!.qr_code,
        AppLocalizations.of(context)!.qr_code_registered,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _takeScreenshot,
            icon: Icon(FluentIcons.save_24_filled),
          ),
          const SizedBox(width: AppDimen.p8)
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1024,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final safePadding = MediaQuery.of(context).padding;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (constraints.maxWidth >= 720)
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: safePadding.left + 24,
                          right: safePadding.right + 24,
                          bottom: 24,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimen.p32),
                          child: Container(
                            decoration: BoxDecoration(color: AppColor.white),
                            child: QrCodeView(qrResponse: _qrResponse),
                          ),
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: AppDimen.p0),
                        if (constraints.maxWidth < 720)
                          Padding(
                            padding: safePadding.copyWith(
                              top: 0,
                              bottom: 0,
                            ),
                            child: Screenshot(
                              controller: screenshotController,
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimen.p16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                      AppDimen.p16,
                                    ),
                                  ),
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppDimen.p32),
                                      child:
                                          QrCodeView(qrResponse: _qrResponse)),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: AppDimen.p0),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: safePadding.copyWith(top: 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimen.p16,
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(
                                          AppDimen.p16,
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                AppLocalizations.of(context)!
                                                    .description,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColor.black,
                                                    ),
                                              ),
                                              subtitle: Text(
                                                widget.qrStatic.motif,
                                              ),
                                            ),
                                            Separator(),
                                            ListTile(
                                              title: Text(
                                                AppLocalizations.of(context)!
                                                    .amount,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColor.black),
                                              ),
                                              subtitle: Text(
                                                widget.qrStatic.amount
                                                    .toString(),
                                              ),
                                              trailing: Text(
                                                widget.qrStatic.currency
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

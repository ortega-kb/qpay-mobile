import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/shared/widgets/qr_code_view.dart';
import 'package:qpay/core/shared/widgets/separator.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/enums/operation_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/utils/qr_response.dart';
import '../../../../di/dependencies.dart';

class MyQrCodeScreen extends StatefulWidget {
  const MyQrCodeScreen({super.key});

  static String path = 'my-qr-code';
  static String route = '/my-qr-code';


  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();
}

class _MyQrCodeScreenState extends State<MyQrCodeScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  late TransactionResponse _qrResponse;

  initialize() {
    _qrResponse = TransactionResponse(
      code: sl<UserInformationService>().userCode,
      type: OperationType.TRANSFER.name,
      amount: null,
      wallet: '',
    );
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
                                                    .account_user,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColor.black),
                                              ),
                                              subtitle: Text(
                                                sl<UserInformationService>()
                                                    .username,
                                              ),
                                            ),
                                            Separator(),
                                            ListTile(
                                              title: Text(
                                                AppLocalizations.of(context)!
                                                    .user_code,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColor.black),
                                              ),
                                              subtitle: Text(sl<
                                                      UserInformationService>()
                                                  .userCode),
                                              trailing: IconButton(
                                                onPressed: () {
                                                  Clipboard.setData(
                                                    ClipboardData(
                                                      text: sl<
                                                              UserInformationService>()
                                                          .userCode,
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  FluentIcons.copy_24_filled,
                                                ),
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

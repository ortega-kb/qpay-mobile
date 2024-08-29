import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qpay/core/utils/enums/operation_type.dart';

import '../../../../core/utils/image_path.dart';
import '../../../../core/utils/qr_response.dart';
import '../../domain/entities/qr_static.dart';

class QRStaticDetailScreen extends StatefulWidget {
  final QRStatic qrStatic;

  const QRStaticDetailScreen({super.key, required this.qrStatic});

  @override
  State<QRStaticDetailScreen> createState() => _QRStaticDetailScreenState();
}

class _QRStaticDetailScreenState extends State<QRStaticDetailScreen> {
  late QrCode _qrCode;
  late QrImage _qrImage;
  late PrettyQrDecoration _prettyQrDecoration;
  late QRResponse _qrResponse;

  initialize() {
    _qrResponse = QRResponse(
      account: widget.qrStatic.account,
      amount: widget.qrStatic.amount,
      type: OperationType.PAYMENT,
      currency: widget.qrStatic.currency,
    );

    _qrCode = QrCode.fromData(
      data: _qrResponse.toValidQRCode(),
      errorCorrectLevel: QrErrorCorrectLevel.Q,
    );

    _qrImage = QrImage(_qrCode);
    _prettyQrDecoration = const PrettyQrDecoration(
      image: PrettyQrDecorationImage(
        image: AssetImage(
          ImagePath.logo,
        ),
      ),
      shape: PrettyQrRoundedSymbol(color: AppColor.primary),
    );
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                            decoration: BoxDecoration(
                              color: AppColor.white
                            ),
                            child: PrettyQrView(
                              qrImage: _qrImage,
                              decoration: _prettyQrDecoration,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: AppDimen.p32),
                        if (constraints.maxWidth < 720)
                          Padding(
                            padding: safePadding.copyWith(
                              top: 0,
                              bottom: 0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimen.p32,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimen.p32),
                                child: PrettyQrView(
                                  qrImage: _qrImage,
                                  decoration: _prettyQrDecoration,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: AppDimen.p16),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: safePadding.copyWith(top: 0),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimen.p16,
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        widget.qrStatic.account,
                                        style: TextStyle(color: AppColor.gray),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: widget.qrStatic.account,
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          FluentIcons.copy_24_filled,
                                          size: 20,
                                        ),
                                      ),
                                    )),
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

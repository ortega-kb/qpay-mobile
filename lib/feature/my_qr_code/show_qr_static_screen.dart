import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/tile_container.dart';
import '../../core/design/spacing.dart';
import '../../core/domain/model/qr_response.dart';
import '../../core/utils/constants/image_path.dart';
import '../../core/utils/enums/operation.dart';

class ShowQrStaticScreen extends StatefulWidget {
  final QRStatic qrStatic;
  const ShowQrStaticScreen({super.key, required this.qrStatic});

  @override
  State<ShowQrStaticScreen> createState() => _ShowQrStaticScreenState();
}

class _ShowQrStaticScreenState extends State<ShowQrStaticScreen> {
  late QrCode _qrCode;
  late QrImage _qrImage;
  late PrettyQrDecoration _prettyQrDecoration;
  late QRResponse _qrResponse;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    _qrResponse = QRResponse(
      account: widget.qrStatic.account,
      amount: widget.qrStatic.amount,
      type: Operation.PAYMENT,
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
      shape: PrettyQrRoundedSymbol(color: primary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.qrStatic.motif),
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
                        child: TileContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(large),
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
                        const SizedBox(height: medium),
                        if (constraints.maxWidth < 720)
                          Padding(
                            padding: safePadding.copyWith(
                              top: 0,
                              bottom: 0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: medium,
                              ),
                              child: TileContainer(
                                child: Padding(
                                  padding: const EdgeInsets.all(large),
                                  child: PrettyQrView(
                                    qrImage: _qrImage,
                                    decoration: _prettyQrDecoration,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: medium),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: safePadding.copyWith(top: 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: medium,
                                  ),
                                  child: TileContainer(
                                    child: ListTile(
                                      title: Text(
                                        widget.qrStatic.account,
                                        style: TextStyle(color: gray),
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
                                          FontAwesomeIcons.solidCopy,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qpay/core/utils/constants/image_path.dart';

import '../../core/design/color.dart';
import '../../core/design/common/widgets/tile_container.dart';
import '../../core/design/spacing.dart';

class MyQrCodeScreen extends StatefulWidget {
  final String? accountNumber;

  const MyQrCodeScreen({super.key, this.accountNumber});

  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();
}

class _MyQrCodeScreenState extends State<MyQrCodeScreen> {
  late QrCode qrCode;
  late QrImage qrImage;
  late PrettyQrDecoration prettyQrDecoration;
  late Map<String, String> metadata;

  @override
  void initState() {
    super.initState();

    qrCode = QrCode.fromData(
      data: '''{"name": "ortega", "total": "45000"}''',
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    qrImage = QrImage(qrCode);
    prettyQrDecoration = const PrettyQrDecoration(
      image: PrettyQrDecorationImage(
        image: AssetImage(
          ImagePath.logo,
        ),
      ),
      shape: PrettyQrRoundedSymbol(
        color: primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_qr_code),
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
                              qrImage: qrImage,
                              decoration: prettyQrDecoration,
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
                                    qrImage: qrImage,
                                    decoration: prettyQrDecoration,
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
                                        "QP4514521",
                                        style: TextStyle(color: gray),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: "QP4514521",
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
                                const SizedBox(height: medium),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: medium,
                                  ),
                                  child: Text(
                                    "subtitle_my_qr_code",
                                    style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.fontSize,
                                      color: gray,
                                    ),
                                    textAlign: TextAlign.center,
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

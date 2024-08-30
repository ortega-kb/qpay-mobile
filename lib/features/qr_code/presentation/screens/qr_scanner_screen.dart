import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/app_color.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    void pauseScan() {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    }

    void scanAndPay(List<String> data) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.p12),
        ),
        backgroundColor: AppColor.background,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ListTile(
                  //   title: Subtitle(
                  //     text: AppLocalizations.of(context)!.payment,
                  //     color: black,
                  //     fontWeight: FontWeight.bold,
                  //     padding: 0,
                  //   ),
                  //   dense: true,
                  //   trailing: InkWell(
                  //     onTap: () {
                  //       controller?.resumeCamera();
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(
                  //       FontAwesomeIcons.xmark,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: medium,
                  //     right: medium,
                  //     top: medium,
                  //     bottom: medium,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //       Text(data[1]),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      );
    }

    void errorScan(String error) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.p12),
        ),
        backgroundColor: AppColor.background,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ListTile(
                  //   title: Subtitle(
                  //     text: AppLocalizations.of(context)!.scan_error,
                  //     color: black,
                  //     fontWeight: FontWeight.bold,
                  //     padding: 0,
                  //   ),
                  //   dense: true,
                  //   trailing: InkWell(
                  //     onTap: () {
                  //       controller?.resumeCamera();
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(
                  //       FontAwesomeIcons.xmark,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: medium,
                  //     right: medium,
                  //     top: medium,
                  //     bottom: medium,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     children: [
                  //       Text(AppLocalizations.of(context)!.desc_scan_error),
                  //       Text(error)
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      );
    }

    void _onQRViewCreated(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen(
            (scanData) {
          try {
            if (scanData.code != null) {
              // if (QrValidity.qrValidity(scanData.code!)) {
              //   scanAndPay(scanData.code!.split("-"));
              //   pauseScan();
              // } else {
              //   errorScan(AppLocalizations.of(context)!.qr_no_valid);
              //   pauseScan();
              // }
              debugPrint(scanData.code);
              pauseScan();
            } else {
              errorScan(AppLocalizations.of(context)!.qr_no_valid);
              pauseScan();
            }
          } catch (e) {
            errorScan(AppLocalizations.of(context)!.qr_no_valid);
            pauseScan();
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.qr_scanner),
        actions: [],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.automatically,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.fontSize,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimen.p16),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.problem_scan,
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize:
                        Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


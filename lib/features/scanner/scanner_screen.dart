import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/subtitle.dart';
import 'package:qpay/provider/qr_scanner_provider.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MobileScannerController scannerController = MobileScannerController();

    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "qr_scanner"),
        actions: [
          Consumer<QrScannerProvider>(
            builder: (context, provider, child) {
              return IconButton(
                isSelected: provider.flashActivated,
                onPressed: provider.frontCamera ? null: () {
                  provider.onClickFlash(!provider.flashActivated);
                  scannerController.toggleTorch();
                },
                icon: Icon(
                  Icons.flash_on_rounded,
                ),
                selectedIcon: Icon(
                  Icons.flash_off_rounded,
                ),
              );
            },
          ),
          Consumer<QrScannerProvider>(
            builder: (context, provider, child) {
              return IconButton(
                isSelected: provider.frontCamera,
                onPressed: () {
                  provider.onClickFrontCamera(!provider.frontCamera);
                  scannerController.switchCamera();
                },
                icon: Icon(Icons.camera_front_rounded),
              );
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: medium),
                  LocaleText(
                    "subtitle_qr_scanner",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    ),
                  ),
                  LocaleText(
                    "automatically_scan",
                    style: TextStyle(
                      color: gray,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(medium),
                child: MobileScanner(
                  controller: scannerController,
                  onDetect: (qrCode) {
                    try {
                      final data = json.decode(qrCode.raw[0]["rawValue"]);
                      print("Json qr code " + data.toString());
                    } catch (e) {
                      print("Normal qr code " + qrCode.raw[0]["rawValue"].toString());
                    }
                  },
                  overlay: Container(
                    color: black.withOpacity(0.5),
                  ),
                  startDelay: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: medium),
                child: Container(
                  alignment: Alignment.center,
                  child: LocaleText(
                    "problem_scan",
                    style: TextStyle(
                      color: gray,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

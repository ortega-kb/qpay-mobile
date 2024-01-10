import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qpay/common/widgets/m_title.dart';
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
          IconButton(
            onPressed: () {
              scannerController.toggleTorch();
            },
            icon: Icon(
              Icons.flash_on_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(medium),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  startDelay: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(medium),
                child: Column(
                  children: [
                    LocaleText(
                      "warning",
                      style: TextStyle(
                        color: black,
                        fontSize:
                        Theme.of(context).textTheme.bodyLarge?.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    LocaleText(
                      "problem_scan",
                      style: TextStyle(
                        color: gray,
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

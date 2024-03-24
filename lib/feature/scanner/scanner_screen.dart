import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/design/color.dart';
import '../../core/design/spacing.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  MobileScannerController scannerController = MobileScannerController();
  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.qr_scanner),
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
                    Text(
                      "subtitle_qr_scanner",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                      ),
                    ),
                    Text(
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
                      print("Normal qr code " +
                          qrCode.raw[0]["rawValue"].toString());
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
                    Text(
                      "warning",
                      style: TextStyle(
                        color: black,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
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

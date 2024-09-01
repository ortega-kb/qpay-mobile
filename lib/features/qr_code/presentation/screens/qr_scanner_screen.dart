import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/qr_payload.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final controller = MobileScannerController(
    returnImage: true,
    detectionSpeed: DetectionSpeed.noDuplicates
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onDispose: () => controller.dispose(),
      hideGalleryButton: true,
      hideGalleryIcon: true,
      extendBodyBehindAppBar: true,
      hideSheetTitle: false,
      sheetChild: Column(
        children: [

        ],
      ),
      sheetTitle: AppLocalizations.of(context)!.qr_scanner,
      onDetect: (barcode) {
        
      },
      validator: (barcode) {
        if (barcode.barcodes.isEmpty) {
          Messages.success('Scan', 'Error !', context);
          return false;
        }
        if (!QrPayload.isValidPayload(barcode.barcodes.first.rawValue!)) {
          Messages.error('Scan', 'Error !', context);
          return false;
        }

        Messages.success('Scan', 'Success !', context);
        return true;
      },
    );
  }
}


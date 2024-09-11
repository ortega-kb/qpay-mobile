import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/qr_payload.dart';

import '../../../../core/utils/enums/operation_type.dart';
import '../../../../core/utils/qr_response.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      detectionTimeoutMs: 1000,
    );

    return AiBarcodeScanner(
      showError: false,
      showSuccess: false,
      controller: controller,
      onDispose: () {},
      hideGalleryButton: true,
      hideGalleryIcon: true,
      extendBodyBehindAppBar: true,
      hideSheetTitle: false,
      sheetChild: Column(
        children: [],
      ),
      sheetTitle: AppLocalizations.of(context)!.qr_scanner,
      onDetect: (barcode) {
        if (barcode.barcodes.isNotEmpty) {
          final qrPayloadRaw = barcode.barcodes.first.rawValue!;
          if (QrPayload.isValidPayload(qrPayloadRaw)) {
            // Parse Qr payload and validate data
            TransactionResponse qrResponse = QrPayload.fromPayload(qrPayloadRaw);
            if (qrResponse.type == OperationType.PAYMENT.name) {
              // If Qr response operation type is PAYMENT,
              // Redirect to payment screen with Qr response data
              controller.stop();
              context.push('/payment', extra: json.encode(qrResponse.toJson()));
            } else {
              // If Qr response operation type is NOT PAYMENT,
              // Display error message or redirect to default screen
              // TODO: Handle not payment payload
            }
          } else {
            // If Qr payload is not valid, display error message
            Messages.error(
              AppLocalizations.of(context)!.qr_scanner,
              AppLocalizations.of(context)!.qr_no_valid,
              context,
            );

            context.pop();
          }
        }
      },
      validator: (barcode) {
        if (barcode.barcodes.isEmpty) {
          return false;
        }
        if (!QrPayload.isValidPayload(barcode.barcodes.first.rawValue!)) {
          return false;
        }
        return true;
      },
    );
  }
}

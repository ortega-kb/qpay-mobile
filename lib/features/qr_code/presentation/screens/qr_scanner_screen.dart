import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/messages.dart';
import 'package:qpay/core/utils/qr_payload.dart';
import 'package:qpay/features/transaction/presentation/screens/add_transaction_screen.dart';

import '../../../../core/utils/enums/operation_type.dart';
import '../../../../core/utils/qr_response.dart';
import '../../../../di/dependencies.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  static String path = 'qr-scanner';
  static String route = '/qr-scanner';

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
            // If QrPayload.isValidPayload
            // Stop controller
            controller.stop();

            // Parse Qr payload and validate data
            TransactionResponse qrResponse =
                QrPayload.fromPayload(qrPayloadRaw);
            if (qrResponse.type == OperationType.PAYMENT.name) {
              // If Qr response operation type is PAYMENT,
              // Redirect to payment screen with Qr response data

              final qrCodeUri = LinkUtil.linkGenerator(
                userCode: qrResponse.code,
                amount: qrResponse.amount.toString(),
                description: qrResponse.description ?? '',
                wallet: qrResponse.wallet!,
              );

              context.push(qrCodeUri.toString());
            } else {
              // If Qr response operation type is NOT PAYMENT, (TRANSFER)
              sl<Logger>().d('Scanning another qr code');
              context.push(
                AddTransactionScreen.route,
                extra: json.encode(
                  qrResponse.toJson(),
                ),
              );
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

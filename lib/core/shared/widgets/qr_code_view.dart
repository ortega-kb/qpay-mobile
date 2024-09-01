import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qpay/core/theme/app_color.dart';
import 'package:qpay/core/utils/image_path.dart';
import 'package:qpay/core/utils/qr_payload.dart';
import 'package:qpay/core/utils/qr_response.dart';

class QrCodeView extends StatelessWidget {
  final QRResponse qrResponse;
  const QrCodeView({
    super.key,
    required this.qrResponse,
  });

  @override
  Widget build(BuildContext context) {
    return PrettyQrView(
      qrImage: QrImage(
        QrCode.fromData(
          data: QrPayload.toPayload(qrResponse),
          errorCorrectLevel: QrErrorCorrectLevel.H,
        ),
      ),
      decoration: const PrettyQrDecoration(
        image: const PrettyQrDecorationImage(
          image: AssetImage(
            ImagePath.logo,
          ),
        ),
        shape: PrettyQrRoundedSymbol(
          color: AppColor.primary,
        ),
      ),
    );
  }
}

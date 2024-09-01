import 'package:qpay/core/utils/qr_response.dart';

class QrPayload {
  // Take de QRResponse model
  // and convert it into a qpay qr_paylaod
  static String toPayload(QRResponse qrResponse) =>
      'qpay-' +
      '${qrResponse.account}-' +
      '${qrResponse.amount}-' +
      '${qrResponse.type}-' +
      '${qrResponse.currency}';

  // Check if the qr_paylaod is valid
  static bool isValidPayload(String payload) {
    try {
      // Try to split our payload
      // and check if list contain 5 fields
      return payload.split('-').length == 5 && payload.split('-')[0] == 'qpay';
    } catch (e) {
      return false;
    }
  }
}

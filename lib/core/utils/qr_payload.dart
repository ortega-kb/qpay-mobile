import 'package:qpay/core/utils/qr_response.dart';

class QrPayload {
  // Take de QRResponse model 
  // and convert it into a qpay qr_paylaod
  static String toPayload(QRResponse qrResponse) =>
      '${qrResponse.account}:' + 
      '${qrResponse.amount}:' + 
      '${qrResponse.type}:' + 
      '${qrResponse.currency}';

  // Check if the qr_paylaod is valid
  static bool isValidPayload(String payload) {
    try {
      // Try to split our payload 
      // and check if list contain 4 fields
      return payload.split(':').length == 4;
    } catch (e) {
      return false;
    }
  }
}

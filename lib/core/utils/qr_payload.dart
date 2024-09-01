import 'package:qpay/core/utils/qr_response.dart';

class QrPayload {
  // Take de QRResponse model
  // and convert it into a qpay qr_paylaod
  static String toPayload(QRResponse qrResponse) =>
      'qpay-' +
      '${qrResponse.accountName}-' +
      '${qrResponse.account}-' +
      '${qrResponse.amount}-' +
      '${qrResponse.type}-' +
      '${qrResponse.currency}';

  // Check if the qr_payload is valid
  static bool isValidPayload(String payload) {
    try {
      // Try to split our payload
      // and check if list contain 5 fields
      return payload.split('-').length == 6 && payload.split('-')[0] == 'qpay';
    } catch (e) {
      return false;
    }
  }

  static QRResponse fromPayload(String payload) {
    final params = payload.split('-');
    return QRResponse(
      accountName: params[1],
      account: params[2],
      amount: double.parse(params[3]),
      type: params[4],
      currency: params[5],
    );
  }
}

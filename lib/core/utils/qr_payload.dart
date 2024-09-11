import 'package:qpay/core/utils/qr_response.dart';

class QrPayload {
  // Take de QRResponse model
  // and convert it into a qpay qr_paylaod
  static String toPayload(TransactionResponse qrResponse) =>
      'qpay-' +
      '${qrResponse.account}-' +
      '${qrResponse.amount}-' +
      '${qrResponse.type}-' +
      '${qrResponse.currency}';

  // Check if the qr_payload is valid
  static bool isValidPayload(String payload) {
    try {
      // Try to split our payload
      // and check if list contain 5 fields
      return payload.split('-').length == 5 && payload.split('-')[0] == 'qpay';
    } catch (e) {
      return false;
    }
  }

  static TransactionResponse fromPayload(String payload) {
    final params = payload.split('-');
    return TransactionResponse(
      account: params[1],
      amount: double.parse(params[2]),
      type: params[3],
      currency: params[4],
    );
  }
}

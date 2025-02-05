import 'package:qpay/core/utils/qr_response.dart';

class QrPayload {
  // Take de QRResponse model
  // and convert it into a qpay qr_paylaod
  static String toPayload(TransactionResponse qrResponse) =>
      'qpay-' +
      '${qrResponse.code}-' +
      '${qrResponse.amount}-' +
      '${qrResponse.type}-' +
      '${qrResponse.wallet}-' +
      '${qrResponse.description}';

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

  static TransactionResponse fromPayload(String payload) {
    final params = payload.split('-');
    return TransactionResponse(
      code: params[1],
      amount: double.parse(params[2]),
      type: params[3],
      wallet: params[4],
      description: params[5]
    );
  }
}

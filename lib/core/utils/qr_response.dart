import 'package:qpay/core/utils/enums/operation_type.dart';

class QRResponse {
  final String account;
  final double? amount;
  final OperationType type;
  final String? currency;

  QRResponse({
    required this.account,
    required this.amount,
    required this.type,
    required this.currency,
  });

  factory QRResponse.fromJson(Map<String, dynamic> json) {
    return QRResponse(
      account: json["account"],
      amount: json["amount"] ?? null,
      type: json["type"],
      currency: json["currency"] ?? null,
    );
  }

  String toValidQRCode() {
    return """qpay-${account}-${amount}-${type}-${currency}""";
  }
}

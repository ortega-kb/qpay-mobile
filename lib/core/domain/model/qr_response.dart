import 'package:qpay/core/utils/enums/currency.dart';

class QRResponse {
  final String account;
  final double? amount;
  final String type;
  final Currency? currency;

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

  Map<String, dynamic> toJson() => {
        "account": account,
        "amount": amount,
        "type": type,
        "currency": currency,
      };
}

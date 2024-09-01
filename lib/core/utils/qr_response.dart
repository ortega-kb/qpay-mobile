import 'dart:convert';

class QRResponse {
  final String account;
  final String accountName;
  final double? amount;
  final String type;
  final String? currency;

  QRResponse({
    required this.account,
    required this.accountName,
    required this.amount,
    required this.type,
    required this.currency,
  });

  factory QRResponse.fromJson(Map<String, dynamic> json) {
    return QRResponse(
      account: json['account'],
      accountName: json['accountName'],
      amount: json['amount'] as double?,
      type: json['type'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'account': account,
      'accountName': accountName,
      'amount': amount,
      'type': type,
      'currency': currency,
    };

    return map;
  }
}

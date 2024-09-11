
class TransactionResponse {
  final String account;
  final double? amount;
  final String type;
  final String? currency;

  TransactionResponse({
    required this.account,
    required this.amount,
    required this.type,
    required this.currency,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      account: json['account'],
      amount: json['amount'] as double?,
      type: json['type'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'account': account,
      'amount': amount,
      'type': type,
      'currency': currency,
    };

    return map;
  }
}

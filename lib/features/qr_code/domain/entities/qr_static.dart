class QRStatic {
  final String account;
  final double amount;
  final String motif;
  final String currency;

  QRStatic({
    required this.account,
    required this.amount,
    required this.motif,
    required this.currency,
  });

  factory QRStatic.fromJson(Map<String, dynamic> json) {
    return QRStatic(
      account: json['account'],
      amount: json['amount'],
      motif: json['motif'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'amount': amount,
      'motif': motif,
      'currency': currency
    };
  }
}
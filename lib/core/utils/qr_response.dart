class QRResponse {
  final String account;
  final double? amount;
  final String type;
  final String? currency;

  QRResponse({
    required this.account,
    required this.amount,
    required this.type,
    required this.currency,
  });
}

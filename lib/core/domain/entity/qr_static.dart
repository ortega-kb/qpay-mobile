import '../../utils/enums/currency.dart';

class QRStatic {
  final String account;
  final double amount;
  final String motif;
  final Currency currency;

  QRStatic({
    required this.account,
    required this.amount,
    required this.motif,
    required this.currency,
  });
}

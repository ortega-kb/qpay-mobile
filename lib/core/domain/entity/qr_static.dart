import '../../utils/enums/currency.dart';
import '../../utils/enums/operation.dart';

class QRStatic {
  final String account;
  final double amount;
  final Operation type;
  final Currency currency;

  QRStatic({
    required this.account,
    required this.amount,
    required this.type,
    required this.currency,
  });
}
